#!/bin/bash -

# Install command-line tools using Homebrew.

hash brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install other useful binaries.
brew install alacritty
brew install tmux
brew install fzf
brew install git
brew install ripgrep
brew install ksnip
brew install rename
brew install mpv
brew install yt-dlp
brew install syncthing
brew install git-delta

# Nerd Fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Terminal file manager
brew install jstkdng/programs/ueberzugpp # show images in a terminal
brew install lf # file manager


# Remove outdated versions from the cellar.
brew cleanup
