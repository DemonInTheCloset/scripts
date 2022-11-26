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
`$XDG_DATA_HOME/scripts` to preserve your changes, you will need to remove those
manually.

Look into `data` to see which files will be created by `make install` into the
`$XDG_DATA_HOME/scripts` directory.

## Documentation

How to manually install the scripts:

1. Look for the script you want.
2. Check the files section.
3. Download the required files.
4. Depending on the parent folder move the files to:
   - `bin`: `~/.local/bin/`
   - `data`: `$XDG_DATA_HOME/scripts` (`~/.local/share/scripts/` by default)

**Remember to respect the folder structure**: ie. [`data/license/LICENSE`](data/license/LICENSE) goes
to `$XDG_DATA_HOME/scripts/license/LICENSE` (`~/.local/share/scripts/license/LICENSE` by default),
not to `$XDG_DATA_HOME/scripts/LICENSE`

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
[`data/license/LICENSE`](data/license/LICENSE) before installing, or
`$XDG_DATA_HOME/scripts/license/LICENSE` after installing.

The script will automatically replace the text `<YEAR>` with the current year
and `<NAME>` with your git user name.

#### Files

- [`bin/license`](bin/license): License script
- [`data/license/LICENSE`](data/license/LICENSE): default MIT license

### Newsboat Reload Notify

Reload newsboat urls and use dunst to send a notification if there are any new
articles.

#### Usage

Ideally set a
[cron](https://wiki.archlinux.org/title/Cron)/[systemd](https://wiki.archlinux.org/title/Systemd/Timers)
Timer to run this script automatically.

Manually running it produces no output:

```console
$ newsboat-reload-notify
```

Exits with non zero return code if no new articles are found

#### Dependencies

- [`dunst`](https://github.com/dunst-project/dunst)
- [`newsboat`](https://github.com/newsboat/newsboat)

#### Files

- [`bin/newsboat-reload-notify`](bin/newsboat-reload-notify)

### Audio Notify

Send a notification with the current volume status (muted/percent)

#### Usage

Ideally used with a keybinding to run:

- `pamixer --increase 5 && audio-notify`
- `pamixer --decrease 5 && audio-notify`
- `pamixer --toggle-mute && audio-notify`

If the volume of the default sink is 0 or it is muted, the notification will
show the volume is muted, otherwise it will show a progress bar.

#### Dependencies

- [`dunst`](https://github.com/dunst-project/dunst)
- [`pamixer`](https://github.com/cdemoulins/pamixer)

#### Files

- [`bin/audio-notify`](bin/audio-notify)

### Brightness Notify

Send a notification with the current brightness of the display.

#### Usage

Ideally use with a keybinding to run:

- `xbacklight -perceived -inc 5 && brightness-notify`
- `xbacklight -perceived -dec 5 && brightness-notify`

#### Dependencies

- [`dunst`](https://github.com/dunst-project/dunst)
- [`acpilight`](https://gitlab.com/wavexx/acpilight)

#### Files

- [`bin/brightness-notify`](bin/brightness-notify)

### DMenu Prompt & DMenu Confirm

Use dmenu to prompt the user for confirmation for an action.

#### Usage

Ideally bind to a key to run something like `dmenu-prompt 'Shutdown?' 'systemctl poweroff'`

#### Dependencies

- [`dmenu`](https://tools.suckless.org/dmenu/)

#### Files

- [`bin/dmenu-prompt`](bin/dmenu-prompt)
- [`bin/dmenu-confirm`](bin/dmenu-prompt)

### Smart Pinentry

Switch between ncurses and gtk Pinentry based on an environment variable.

#### Usage

Set `PINENTRY_USER_DATA` to `none` to deny Pinentry (ie. in `$ZDOTDIR/.zshenv`).
Override it to `gtk` if you know you are in a graphical environment (ie. in
`$ZDOTDIR/.zprofile` before launching the X server (xinit/startx)), and set it
to `curses` if you are in an interactive shell (ie. in `$ZDOTDIR/.zshrc`).

If `PINENTRY_USER_DATA` isn't set it will default to launching through `gtk`.

#### Dependencies

- [`pinentry`](https://gnupg.org/related_software/pinentry/)

#### Files

- [`bin/smart-pinentry`](bin/smart-pinentry)

### Select Sink/Source

DMenu based default pulseaudio source/sink selection.

#### Usage

Bind launching the scripts to a keybinding and you will be prompted by dmenu to
select a default source/sink.

#### Dependencies

- [`dmenu`](https://tools.suckless.org/dmenu/)
- [`pactl`](https://www.freedesktop.org/wiki/Software/PulseAudio/)
- [`pamixer`](https://github.com/cdemoulins/pamixer)

#### Files

- [`bin/select-source`](bin/select-source)
- [`bin/select-sink`](bin/select-sink)

### Auto Clicker/Kill Auto Clicker

Scripts to launch and kill an autoclicker, useful for clicker games.

#### Usage

Bind a key to `auto_clicker` and another to `kill_auto_clicker`, that way you
can start and stop the clicker, make sure you test the keybindings work properly
before using them as it might be hard to stop the clicker otherwise.

#### Dependencies

- [`xdotool`](https://www.semicomplete.com/projects/xdotool/)
- [`pgrep`](https://gitlab.com/procps-ng/procps) _should come preinstalled_

#### Files

- [`bin/auto_clicker`](bin/auto_clicker)
- [`bin/kill_auto_clicker`](bin/kill_auto_clicker)

### Wakatime Query

Query your mail to get project statisctics from [Wakatime](https://wakatime.com/)

#### Usage

Run `wakatime-query 'myproject'` and you'll get the time worked on it each week
in descending order (latest week first)

```cmd
$ wakatime-query scripts
1 hr 4 mins
2 hrs 53 mins
15 mins
0 secs
```

**Warning:** It uses the name of the parent folder, not of the GitHub project,
ie. My [dotfiles](https://github.com/DemonInTheCloset/dotfiles/) are managed by
chezmoi so they are under `~/.local/share/chezmoi/` and thus I have to use
`wakatime-query chezmoi` to get the time I've worked on it.

#### Dependencies

- [`notmuch`](https://notmuchmail.org/)
- [`xargs`](https://www.gnu.org/software/findutils/) _should come preinstalled_

#### Files

- [`bin/wakatime-query`](bin/wakatime-query)

### Notmuch Notify

Index your mailbox and send a notification if new mail is found.

#### Usage

Set up a cronjob or use a program like [goimapnotify](https://gitlab.com/shackra/goimapnotify)
to run this script after fetching your mail (ie. with `mbsync` or a `notmuch`
pre-new hook).

#### Dependencies

- [`notmuch`](https://notmuchmail.org/)
- [`dunst`](https://github.com/dunst-project/dunst)

#### Files

- [`bin/notmuchnotify`](bin/notmuchnotify)

### Dunst Toggle

Toggle pause state of dunst notifications.

#### Usage

Set up a keybinding to toggle the notifications.

#### Dependencies

- [`dunst`](https://github.com/dunst-project/dunst)

#### Files

- [`bin/dunst-toggle`](bin/dunst-toggle)
