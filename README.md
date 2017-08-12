# dotfiles

This will change the system to my personal preferences 🤘

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
Copy settings to this repo. This will copy all files used by `./macos.sh` here.

```bash
./backup.sh
```

Other things I've left out:
* https://github.com/powerline/fonts

Inspired by https://github.com/mathiasbynens/dotfiles
