# Abstract {#index}

`makefile` based build system

# Use

Copy the `test` project in `projects/test` to `projects/yourproject`.

The included `makefile` expects you to provide `TARGET` on the command line:

    $ make TARGET=yourproject V=1 all

This will cause the build system to import `makefile` from
`buildsys/projects/yourproject/makefile`, which, in turn, will import
`buildsys/build/buildsystem.mk`.

You may also build from `buildsys/projects/yourproject`.

The build system provides some variables in `build/buildsystem.mk`:

- `mkfile_path`: the path to `buildsystem.mk`.
- `buildsys_dir`: the root directory of `buildsystem.mk`.

`build/target_rules.mk` contains target rules if you wish to modify them.

`build/cmdline.mk` processes command line arguments:
It exports `DEBUG_FLAGS` as `-O0 -ggdb` if you specify `D=1` on the command line,
the default is `D=0`.
If you specify `V=1` the <code>\$(Q)</code> variable will be exported as `Q = @`,
the default is `V=0`.

`build/toolchain.mk` contains host specific tool paths,
e.g. `C:\MinGW\msys\1.0\bin\g++.exe` on Windows,
and `/usr/bin/g++` on Linux/Mac.
Tools may be prefixed with <code>\$(Q)</code> for customized output formatting.

# Building Documentation

This documentation is built with [Doxygen](http://www.stack.nl/~dimitri/doxygen/index.html).

It may be built as follows:

    $ make doc
