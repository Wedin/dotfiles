# dotfiles

These are the dotfiles I use on my mac and will change the system to my personal preferences 🤘.

## Usage

Clone the directory to wherever you want, I like to keep mine in `~/Projects/dotfiles`, and run the following commands.

### Installing Homebrew

Installs Homebrew and some common Homebrew formulae
```bash
./brew.sh
```

### macOS defaults
Run to customize a new Mac to my settings. This will overwrite any existing files. This currently includes my personal git configs 👻. This will also install defaults for some common apps I use, which are installed with the homebrew command.
```bash
./macos.sh
```

### Backup
Copy settings to this repo. This will copy all files used by `./macos.sh` here. Currently copies settings for Spectacle, Sublime Text and git configs.

```bash
./backup.sh
```

The iTerm2 profile needs to be exported seperately `Preferences -> General -> Load preferences from a custom folder or URL`.

### Post-installation:
* Install missing Sublime Text packages.

Inspired by https://github.com/mathiasbynens/dotfiles
