#!/bin/bash -

# Install command-line tools using Homebrew.

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

# Remove outdated versions from the cellar.
brew cleanup
