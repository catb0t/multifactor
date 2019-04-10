# multifactor v0.3 [![Travis build status](https://api.travis-ci.org/catb0t/multifactor.svg?branch=master)](https://travis-ci.org/catb0t/multifactor) 

To end the hassle of having to manage [Factor](https://github.com/factor/factor) images and executables for different branches / revisions.

## Overview

Written in Trizen's [Sidef](https://github.com/trizen/sidef); HEAD is preferred but 3.70 should work.

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
