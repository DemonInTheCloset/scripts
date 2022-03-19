# scripts

A repository of scripts that I found useful to have

## Installing

If you want a specific script then look at their [documentation below](#documentation).

To get all the scripts just download this repository, go into the folder and run
`make install`, this will install the scripts to `~/.local/bin/` so make sure it
is in your `$PATH`.

## Uninstalling

To uninstall you **need** the **whole repository**, so download it and go into
the folder, then run `make uninstall`, this won't purge the things in the
`$XDG_CONFIG_HOME` to preserve your changes, you will need to remove those
manually.

Look into `config` to see which files will be created by `make install` into the
`$XDG_CONFIG_HOME` directory.

## Documentation

How to manually install the scripts:

1. Look for the script you want.
2. Check the files section.
3. Download the required files.
4. Depending on the parent folder move the files to:
   - `bin`: `~/.local/bin/`
   - `config`: `$XDG_CONFIG_HOME` (`~/.config/` by default)

**Remember to respect the folder structure**: ie. `config/license/LICENSE` goes
to `$XDG_CONFIG_HOME/license/LICENSE` (`~/.config/license/LICENSE` by default),
not to `$XDG_CONFIG_HOME/LICENSE`

### License

Prints a license file for your git repo

#### Usage

Inside a git repository run:

```console
$ license
Copyright 2022 DemonInTheCloset

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

You can directly pipe the output to a file `license > LICENSE.txt`

##### Custom License

If you don't want to use the default MIT license then simply overwrite the file
`config/license/LICENSE` before installing, or
`$XDG_CONFIG_HOME/license/LICENSE` after installing.

The script will automatically replace the text `<YEAR>` with the current year
and `<NAME>` with your git user name.

#### Files

- `bin/license`: License script
- `config/license/LICENSE`: default MIT license

### Advance Time

Using systemd's `timedatectl` disable ntp and set the date to something else
(useful for clicker games)

#### Usage

```console
$ advance_time '3 day'
Advancing time to 2022-03-22 16:54:45
```

#### Files

- `bin/advance_time`
