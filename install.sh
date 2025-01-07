#!/bin/bash

# get current directory
DIR=$(dirname $(realpath "${BASH_SOURCE[0]}"))

echo "Script Directory: $DIR"

ln -sf $DIR/home/.gitconfig ~/.gitconfig
ln -sf $DIR/home/.profile ~/.profile
ln -sf $DIR/home/.env ~/.env
ln -sf $DIR/home/.shell_aliases ~/.shell_aliases
ln -sf $DIR/home/.zshrc_hooks ~/.zshrc_hooks
ln -sf $DIR/home/.zshrc ~/.zshrc