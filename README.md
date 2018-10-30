# factor.bash v0.2

no more sneaky bugs from having a single [Factor](https://github.com/factor/factor) binary and `factor.image` for every branch you work on!

---

* put this executable script somewhere in your `$PATH`

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
2. the hash in the binary's filename is different than the hash created from files in `resource:vm/` <!-- and the argument wasn't `nomtime` [no modified time]-->

it will only rebuild the image when

1. it gets at least 1 argument that isn't `--` or `noop`, and
2. the hash in the image's filename is different than the hash created from files in `resource:basis/` and `resource:core/` or <!--and the argument wasn't `nomtime` or-->
3. `refresh-all` fails due to inconsistency between the image, and the source files in `resource:basis/` or `resource:core/`

use `factor.bash forcerebuild` to trigger a branch rebuild regardless of existing files or modified times

use `factor.bash noop` to print information and do nothing

arguments after `--` will be passed to the final Factor VM (if it runs successfully)

## notes

* **you may want to add a line like `_[A-Za-z0-9.-_]*_factor.*` to your global gitignore (`core.excludesFile`) to avoid tracking the per-branch binaries / images**

* due to the "unique" way `GIT_LABEL` is determined in Factor's `GNUmakefile`, the value of `vm-git-label` in Factor may be unexpected and may not represent the actual git branch the binary and image have been built from
