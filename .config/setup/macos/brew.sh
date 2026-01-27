#!/bin/bash -

# Install command-line tools using Homebrew.

hash brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU coreutils is a collection of essential command-line tools that
# provide a more feature-rich and consistent user experience. Adds the GNU
# version of the basic commands like: ls, cat, cp, mv, rm, echo, sort, head,
# date ...
# To use the GNU version, you have to add the 'g' at the beginning of the
# command, like: gls, gcp, gdate...
brew install coreutils

brew install zsh-syntax-highlighting
# Install other useful binaries.
brew install alacritty
brew install xclip
brew install tmux
brew install fzf
brew install git
brew install ripgrep
brew install neovim
brew install ksnip
brew install rename
brew install mpv
brew install yt-dlp
brew install syncthing
brew install git-delta
brew install bat
brew install --cask pinta

# hotkey daemon
brew install koekeishiya/formulae/skhd
skhd --start-service

# Nerd Fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Terminal file manager
brew install jstkdng/programs/ueberzugpp # show images in a terminal
brew install lf # file manager

# Remove outdated versions from the cellar.
brew cleanup
