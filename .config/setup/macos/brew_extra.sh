#!/bin/bash -
brew install --cask syncthing
# Set Syncthing up as a service to run automatically at startup
brew services start syncthing

# Software that opens kdbx files, aka KeePass Password Safe files
brew install --cask macpass
# GitHub Readme Instant Preview - Markdown local preview
brew install grip
