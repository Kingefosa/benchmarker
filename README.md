# Mono Benchmarker

## Configuring

Each Mono configuration requires a `.conf` file.  The files in the `configs` directory are examples.  The `$DIR` variable points to the benchmarker root directory.  Neither the results directories nor the mono executable need to be in subdirectories, like they are in the example configs.

## Benchmarking

To run the suite for a specific revision, use the `runner.sh` script. It must be run in the benchmarker root directory:

    ./runner.sh [-c <commit-sha1>] <revision> <config-file> ...

The revision can be an arbitrary string, but revision strings must be string-comparedly ascending.  [This blog post](http://blog.marcingil.com/2011/11/creating-build-numbers-using-git-commits/) describes a method for deriving such a revision string from git commits.  We would have to use more than four digits for the commit counter, of course.  If the SHA1 is available, pass it on.  It is used by the collect script for user-friendliness.

The script will place the result files in the directories `$RESULTS_DIR/$CONFIG_NAME/r$REVISION`.

## Producing running graphs

To collect benchmarking results from all configurations and revisions, use `collect.pl`, like so:

    ./collect.pl <root-dir> <config-subdir> ...

Where each of the `config-subdir` is a subdirectory of `root-dir`.  Typically `root-dir` would be `$RESULTS_DIR` and `config-subdir` would be `$CONFIG_NAME` from the configuration files.

The script will generate in `index.html` in `root-dir` and further HTML and image files in the subdirectories.  Note that each of the individual original result files is linked to, so the whole `root-dir` tree is necessary for viewing, not just the files generated by `collect.pl`.

## Comparing directly

To compare two or more revisions and/or configurations directly, use `compare.py`:

    ./compare.py <revision-dir> <revision-dir> ...

Where each `revision-dir` is a directory containing the `.times` files generated by `runner.sh`.
