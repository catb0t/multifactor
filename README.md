# multifactor v0.3 [![Travis build status](https://api.travis-ci.org/catb0t/multifactor.svg?branch=master)](https://travis-ci.org/catb0t/multifactor)

To end the hassle of having to manage [Factor](https://github.com/factor/factor) images and executables for different branches / revisions.

## Overview

Written in Trizen's [Sidef](https://github.com/trizen/sidef); requires my [`hack`](https://github.com/catb0t/sidef/tree/hack) branch at HEAD because of features I haven't PR'd into upstream yet.

Trying to use as few (3rd party) CPAN modules as possible. Depends on the core modules `forks` and `JSON::XS` (but `JSON::PP` will be used if it's found).

`sidef multifactor.sm [options] [--] [parameters to Factor]`

Use `multifactor.sm --help` or `-h` for more information on MultiFactor invocation:

```
Usage: multifactor [-abcDdnwfhiCQSqRstVv] [arg...]
multifactor v0.3: a meta build system for Factor core development

Arguments
	    arg...              Arguments to the final Factor VM

Options
	    --                  End multifactor's argument list
	                        Further arguments are given to Factor
	-a, --action=<name>     Perform this action
	                        actions: run-factor, src-sums, env-info
	                        default value: 'run-factor'
	-b, --basis-dev         Ignore changes in basis/
	                        (basis development mode)
	-c, --clean             [auto] Always 'make clean'
	-D, --db-name=<name>    Custom database filename
	                        default value: '.multifactor.db'
	-d, --db-path=<path>    Path to dir containing database
	                        default value: '.'
	-n, --dry-run           Change no disk files
	-w, --factor-dir=<path> Path to Factor working directory
	                        default value: '.'
	-f, --force             Force a rebuild in any case
	-h, --help              Show this help
	-i, --info              Just show configuration information
	-C, --no-clean          Never 'make clean'
	-Q, --no-quiet-subcom   Always show subcommand outputs
	-S, --no-sums           Never use checksums
	-q, --quiet-subcom      [auto] Never show subcommand outputs
	-R, --remove-old-lock   Blindly remove any lock files (unsafe!)
	-s, --sums              [auto] Always use checksums
	-t, --trace             Some debug tracing
	-V, --verbose           Verbose debug tracing
	-v, --version           Print version and exit

Config
	Unknown options are an error
	Help output is printed on STDERR
	Numeric short names like '-2' are disabled
	Positional arguments and options are not currently supported

	Mandatory arguments to long options are mandatory for short options too.
```

## Rationale

There are three basic operational goals.

1. Run Factor if an entry matches the current source code configuration, and the binary/image checksums match.
2. Compile a new binary or new image if either doesn't exist.
3. Manage these actions with a simple data structure.

This way, MultiFactor will manage built objects for each git branch, git tag, and source code configuration you desire, without mixing them up.

* Factor's built-in build system compiles a `factor` VM executable ("binary") from the C++ source in [`vm/`](https://github.com/factor/factor/tree/master/vm) when you use `make`, and builds a `factor.image` VM image ("image") from the Factor source in [`core/`](https://github.com/factor/factor/tree/master/core) and [`basis/`](https://github.com/factor/factor/tree/master/basis) with `./factor -i=boot.*.image`. (Together with `libfactor.a` etc, these make up "built objects".)

* A binary built with one revision of the `vm` code will not be compatibile with an image built by a binary with different / too old `vm` code, and will crash.

* The image has key vocabularies in `core` and `basis` compiled into it. If the source of these on disk is different than what is compiled into `factor.image`, the VM will either crash or need to refresh at startup. <small> You *can* also `refresh-all save`, but that takes a long time. </small>

To prevent cross-contamination of binaries and images every time you change branches or `git pull`, MultiFactor uses a simple database-like structure to track built objects.

It gives them a unique name, and allows you to easily compile a new Factor, or run one that matches your disk configuration.

MultiFactor is not designed to replace Factor's built-in `build.sh`, although `shell_words.sm` does re-implement most of `build.sh`'s back-end functionality.

## Implementation

The Sidef implementation of MultiFactor consists of 4 layers, each of which can only rely on code from itself and the layers above it. The contents of each layer are primarily determined by necessity and the unique way in which Sidef modules work, not by my choice.

0. (Sidef itself)
1. SidefExt (general extensions to the basic Sidef language)
2. Lib (library code that isn't necessarily specific to multifactor)
3. Providers (provides libraries that are pretty specific to multifactor)
4. Multifactor.sm  (the consumer code)

**SidefExt** patches features that I think belong in the Sidef core language, but are either impractical to write in Perl, should be user-supplied code, or I simply haven't PR'd upstream Sidef with the Perl implementation yet. Sidef has 34,000 lines of Perl, with hundreds of builtin methods on 30 builtin types -- it is definitely batteries-included, I'm just picky.

* `checked` provides checked variable references. Sidef allows for Perl pointers to variables, referencing and dereferencing them like C. I wrote this module because I needed to debug some code that involved Sidef pointers, but the pointers were not the bug. This module is debug-only.

* `combi` provides function-oriented combinators from stack-oriented languages like Factor. I wanted for Factor's `bi` (bifurcate) in Sidef as it clarifies a lot of code without a needless local variable. The variadic version of `bi` is `cleave`, which is an inline macro in Factor. `ifte` and friends are similarly inspired by Factor, and Finalizers (destructors and/or try-finally) are simply a combinator missing from Sidef. The Finalizer implementation is still incomplete as it cannot handle signals.

* `construct` is a module with one function, `maybe_init`, which takes an unknown value (such as a typename or an instance), constructs it if it's a typename, and calls its method whose name is stored in its `INIT_METHOD_NAME` member if it has such a member. The former part is a function which has the same value for the inputs `X` (type) and `X()` (instance), while the latter part would just call `.init` but must work around [#79](https://github.com/trizen/sidef/issues/79).

* `iterable` implements missing methods on iterable Sidef builtins. Most of them are weirdly specific to my use-case (such as `change_truthy_by` and `change_extant_by`, though these will be in upstream eventually), except for `is_iterable_object` (which should be in upstream) and ImmutableHash, which is a quite general Hash without any (most) of its mutating methods.

* `metatype` implements a Maybe type for Sidef that's available at compile-time (i.e., `define`-time), except Sidef doesn't have type parameterisation of any kind, so it's built using hacks and emulation. The point is for strong typechecking even when `null` or `nil` are allowable values. It also contains definitions of ExtantArrStr (a non-empty String or Array of non-empty Arrays or Strings) and the list of iterable types, which I think is a meta-type, but one could argue belongs in `iterable`.

* `object` implements methods missing from Sidef's builtin Object. Specifically, loading it provides, on all subclasses of Object, the method forms of `rescope` and `cleave` (the function forms are in `combi`), `namedcleave`, `n_all`, `n_any`, `retry`, `declares_method`, and `is_an_object`, the last two of which are unbelievably important to metaprogramming in Sidef.

* `summary` is another feature inspired by Factor. Factor's [`summary` vocabulary](https://docs.factorcode.org/content/vocab-summary.html) is "... for getting very brief descriptions of words and general objects". `summary` is also the name of a generic word, which has many methods for builtins, but users can write `M: my-tuple-class summary ... ;` to implement it for their classes. `summary.sm` provides a base class, `Summarizable`, and courtesy `summary` methods on `Object` and `String`.

* `xchg` implements reliable data interchange for all Sidef data types, for JSON and other kinds of serialization, in the form of `module Explicit`. `xchg` exists to patch a behaviour inherent to Sidef's Perl roots: Perl sees the literal `".99"` as neither a "string" or "number", but simply scalar data that may be interpreted in various ways. Unfortunately, in Sidef, we (I) have specific expectations about the type of the expression `".99"`; it's a String, and should never be affected by the interpreter's decimal precision setting. The string `"0.99912291"` is losslessly represented as `Hash( __XT => "!B!String.String", __XV => "0.99912291" )`.

**Lib** are libraries providing basic functionality which is neither a Sidef language extension nor a use-specific API Provider.

* `ABCs` ostensibly provides abstract base classes, but actually only gives specific functionality as the following base classes: `Serializable`, `SeriallyEquatable`, `SeriallyAccessible`, `ModularInit`, and `Lockable`. `Serializable` is a compliment to (and is older than) `xchg`, and allows for classes to specify which of their members are serializable data. `SeriallyEquatable` uses this information (`.serial_properties`) to perform comparisons like `==` on objects automatically. `SeriallyAccessible` uses extra data in `.serial_properties` to generate accessors (getters/setters), because I got tired of maintaining redundant members and accessors. `ModularInit` allows a class to specify steps to be taken in subclasses' `method init`, and compatible with `SeriallyAccessible`'s features, like `super().init()` isn't. Finally, `Lockable` simulates immutability for data classes by disabling setter accessors. The name `ABCs` is a reference to the Python standard library module `abc`.

* `breakpoint` is a debugging library, which pauses the invoking thread until a key is pressed, so that a developer may observe the program's effects until that point, or press 'q' to quit if they can already identify a problem. It does not currently call finalizers.

* `command` provides a clean wrapper around shell-script-style invocation of shell commands, `spawn_se`, as well as predefined `make` and `nmake` invokers. Usually `%x()` and the backtick literal are enough for e.g. `git` commands where all that matters is the string output, but for `make`, its return code is more useful than trying to parse its output for error status.

* `dbtransform` implements transformations (`Transformation`) on Hashes as a method of read-write-commit data management. In other words, throughout its execution, MultiFactor should read and write the database at most once, respectively. It is never needed to commit (or read) written data before the program has finished, so the database modification code can be very simple, orderless, deduplicating (TODO: test whether that's implemented), and one-directional. Of course, `dbtransform` can commit changes as often as needed during a program's execution, but this use case only needs one or fewer commits per run.

* `feature` is a wrapper for Sidef's builtin method of making Perl modules usable from Sidef -- the String `frequire` and `require` methods. It implements many features over the default ways, such as ensuring modules are loaded only once at program start, looking for modules by name, loading modules in parallel, and caching the list of installed modules.

* `frext` provides functional and reflective extensions for Sidef metaprogramming. This module contains those extensions that are a little too high-level or specific to fit in **SidefExt**. It provides the Object methods `has_overload` (which involves attempting a method call with specific arguments and returning the exception), `has_public_concrete_overload` (ditto, but checking first that the method name is declared and exists), `is_property` (uses heuristics / implementation details to determine whether a member is a data property or a callable method), and variations on `grep_methods` (`grep_sorted_methods`, `grep_map_methods`, and `grep_sorted_map_methods`), all of which exist to minimise the number of times the `methods` iterable is iterated, for a performance improvement.

* `guardio` implements guarded / checked I/O. Sidef's I/O API is already higher-level than Perl's, which I dearly appreciate, but leaves some things to be desired, which is a good thing, and why this is **Lib**, not **SidefExt**. `guardio` provides the `GuardIO` and `Atomic` modules, and the `GlobLocker` class, which is a use-tailored lockfile implementation. Also, nothing on CPAN did quite what I wanted, and obviously not in a Sidef way.

* `msg_classes` classifies error/exception messages using Regex, primarily Sidef's built-in ones that it gives for wrong invocations / method names / return values / garbage object uses (such as HASH `{indexing}` on ARRAY references). This provides part of the basis for `has_overload` and `is_property`, among other things.

* `shell_words` implements functionality from Factor's `build.sh` in Sidef, as well as a lot of other features not in `build.sh`. MultiFactor used to be a naive Bash script, which simply "imported" `build.sh`'s variables and functions. Now that MultiFactor is written in Sidef, it's unladylike and improper to rely on a Bash script for fundamental operation of MultiFactor. Specifically, it would require glue Bash code (because `build.sh` is not intended for use as a library), lacks typechecking and a lot of basic language safety, and would be a PITA. `shell_words::BuildSh` is a "static verb class", which can-not be constructed, but the methods of which must be used statically on the typename itself, e.g. `BuildSh.git_branch`.

* `withdirectory` provides a Python-like context managers for managing filesystem interaction state. Specifically, `WithDirectory` obviates the need to keep track of which directory is the current, and `CapturedWriter` implements debugging and disabling of filesystem writes, for example to implement the `--dry-run` option.

**Providers** are APIs that are essentially unique and specific to MultiFactor.sm, with the notable exception of `argparse`.

* `argparse` is named after Python's (in)famous `argparse` module. It's accidentally quite similar to the Python module (especially by being simplistic and not supporting positional parameters), even though I don't like or use `argparse` in Python. I prefer `docopt`, which I was going to implement in Sidef instead of `argparse`, except that would have taken even longer, and `argparse` was the first module I wrote for the Sidef implementation of MultiFactor, so it needed to be finished quickly. Thus, `argparse.sm` has more `TODO`s than any other module, and is a completely stand-alone module (has no includes/imports).

* `builtobj` provides the data classes that are core to the MultiFactor database, all of which inherit from `SeriallyEquatable` or `SeriallyAccessible`, and `Lockable`: `DirSum` (a directory's checksum), `SrcSums` (a handful of DirSums), `BlobSums` (binary blob checksums), `VirtualBase64Blob` (an in-memory base64 binary blob checksum), `TimeSpec` (a handful of timestamps), and the titular `BuiltObj` (a collection of the previous objects and others). These would be `struct`s, except `structs` may not have *any behaviour* including accessors.

* `cachedb` provides a caching document-oriented database. Based on `dbtransform`'s Transformation and `withdirectory`'s CapturedWriter, it ensures consistent, safe, and optimized database access, with no redundant reads or writes before absolutely necessary.

* `factorbash` specializes on `shell_words`, implementing stateful (class instance-based) methods as a high-level API extension to `shell_words`, such as interfaces for building Factor and Factor boot images, and delegation of method calls to itself or `shell_words::BuildSh`.


**MultiFactor** itself contains the main entry point and its MultiFactor.go method is where most of the above library code is used.

The code has a decent amount of comments, mostly for me to remember what's happening in the complicated parts. Please read them and complain if you don't understand something.

Most of the top 3 layers have quite good test coverage in `tests/` (with some notable untestable exceptions), but `multifactor.sm` is notoriously hard to test, and I am always trying to move complex code out of it into testable libraries.

---

<!--
* put this executable script somewhere in your `$PATH` (optional: name it `factor`)

* `export FACTOR_FOLDER` as the path to your [factor/factor](https://github.com/factor/factor) git repository in your `.bashrc`, and `source ~/.bashrc`

* (optional) `export TRIM_HASH_TO` to control the length the hashes are cut to (longer prevents collisions, shorter is better for your filesystem; default=12)

* run the script with any argument: `factor.bash a`; it will build a binary and image for your current branch

* checkout a different `factor/factor` branch

* run the script with an argument again and it builds a new, separate binary and image for the branch

* if the image compilation crashes, it will re-bootstrap indefinitely until it builds a working image (or you kill it)

  if the `boot.*.image` is from a commit near-ish that of `core/*` and `basis/*`, it will probably build... eventually

  otherwise [manually download the image](https://downloads.factorcode.org/images/build) closest in age to `core` and `basis`

requires: `bash` approx. >= `4.3`, `git` >= `1.78`, `dc`, `stat`, `fold`, etc

Linux / Unix only currently (it might work on mac os, haven't ported to Windows CMD yet)

it will only rebuild the binary when

1. it gets at least 1 argument that isn't `--` or `noop`, and
2. the hash in the binary's filename is different than the hash created from files in `resource:vm/` and the argument wasn't `nomtime` [no modified time]

it will only rebuild the image when

1. it gets at least 1 argument that isn't `--` or `noop`, and
2. the hash in the image's filename is different than the hash created from files in `resource:basis/` and `resource:core/` or and the argument wasn't `nomtime` or
3. `refresh-all` fails due to inconsistency between the image, and the source files in `resource:basis/` or `resource:core/`

use `multifactor --force-rebuild` to trigger a branch rebuild regardless of existing files or modified times

use `multifactor --no-op` to print information and do nothing

arguments after `--` will be passed to the final Factor VM (if it runs successfully)

## notes

* **you may want to add a line like `_[A-Za-z0-9.-_]*_factor.*` to your global gitignore (`core.excludesFile`) to avoid tracking the per-branch binaries / images**

* due to the "unique" way `GIT_LABEL` is determined in Factor's `GNUmakefile`, the value of `vm-git-label` in Factor may be unexpected and may not represent the actual git branch the binary and image have been built from

-->
