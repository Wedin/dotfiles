# 💻  dotfiles  💻

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

### Installation:
1 . Install any missing Sublime Text packages.

2 . Install [`oh-my-zsh`](https://github.com/robbyrussell/oh-my-zsh).

3 . Install zsh plugins. I am currently using the two plugins: [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting) and [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions). Install the plugins or remove the lines which includes the plugins from the bottom of the `.zshrc`.

4 . Download the color scheme for iTerm2. I'm currently using the `DimmedMonokai` color theme from [`iTerm2-Color-Schemes`](https://github.com/mbadolato/iTerm2-Color-Schemes).

5 . Setup iTerm2.

Load the preferences by the settings under `iTerm2 > Preferences > General`. Tick the box `Load preferences from a custom folder or URL:` and point it to `~/Projects/dotfiles/apps/iTerm2`.

Select `iTerm2 > Preferences > Profiles` and create a new profile. In the colors tab, choose Color preset and import the color scheme you've downloaded.


Inspired by https://github.com/mathiasbynens/dotfiles
