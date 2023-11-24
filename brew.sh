#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install other useful binaries.
brew install git
brew install ripgrep
brew install rename

# Remove outdated versions from the cellar.
brew cleanup
