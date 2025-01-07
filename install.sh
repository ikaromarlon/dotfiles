#!/bin/zsh

# get current directory
DIR=$(dirname $(realpath "$0"))

# get zsh-autosuggestions directory
ZSH_AUTOSUGGESTIONS_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installing oh-my-zsh..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm -rf $ZSH_AUTOSUGGESTIONS_DIR
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS_DIR

echo "Setting up dotfiles..."

ln -sf "$DIR/home/.gitconfig" ~/.gitconfig
ln -sf "$DIR/home/.profile" ~/.profile
ln -sf "$DIR/home/.env" ~/.env
ln -sf "$DIR/home/.shell_aliases" ~/.shell_aliases
ln -sf "$DIR/home/.zshrc_hooks" ~/.zshrc_hooks
ln -sf "$DIR/home/.zshrc" ~/.zshrc

source ~/.zshrc

echo "Dotfiles set up successfully!"