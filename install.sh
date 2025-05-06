#!/bin/zsh

set  -e

# Check if zsh is installed
if command -v zsh &> /dev/null; then
  echo "zsh is already installed."
else
  echo "zsh is not installed. Attempting installation..."

  # Determine the operating system
  os=$(uname -s)

  if [[ "$os" == "Darwin" ]]; then # macOS
    if command -v brew &> /dev/null; then
      brew install zsh
      if [[ $? -eq 0 ]]; then
        echo "zsh installed successfully via Homebrew."
      else
        echo "Failed to install zsh via Homebrew."
        exit 1
      fi
    else
      echo "Homebrew not found. Please install Homebrew and try again."
      exit 1
    fi
  elif [[ "$os" == "Linux" ]]; then
    sudo apt-get update
    sudo apt-get install -y zsh
    if [[ $? -eq 0 ]]; then
      echo "zsh installed successfully."
    else
      echo "Failed to install zsh."
      exit 1
    fi
  else
    echo "Unsupported operating system: $os"
    exit 1
  fi
fi

echo;

echo "Making zsh the default shell..."
chsh -s $(which zsh)

# Check if oh-my-zsh is installed
if [[ -d ~/.oh-my-zsh ]]; then
  echo "oh-my-zsh is already installed."
else
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo;

# get current directory
DIR=$(dirname $(realpath "$0"))

echo "Setting up zsh-autosuggestions..."
# get zsh-autosuggestions directory
ZSH_AUTOSUGGESTIONS_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
rm -rf $ZSH_AUTOSUGGESTIONS_DIR
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS_DIR

echo;

echo "Setting up nvm and Node.js..."
# Check if nvm is installed
if command -v nvm &> /dev/null; then
  echo "nvm is already installed."
else
  echo "nvm is not installed."
  echo "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  echo "nvm installed successfully."
fi

echo;
# Check if Node.js is installed (using nvm)
if nvm ls | grep -q "v"; then
  nvm ls
  echo "Node.js is already installed via nvm."
else
  echo "Installing Node.js..."
  nvm install --lts
  echo "Node.js LTS installed successfully."
fi

echo;

echo "Setting up dotfiles..."

LN_GITCONFIG='ln -sf "$DIR/home/.gitconfig" ~/.gitconfig'
LN_PROFILE='ln -sf "$DIR/home/.profile" ~/.profile'
LN_ZPROFILE='ln -sf "$DIR/home/.zprofile" ~/.zprofile'
LN_ENV='ln -sf "$DIR/home/.env" ~/.env'
LN_SHELL_ALIASES='ln -sf "$DIR/home/.shell_aliases" ~/.shell_aliases'
LN_ZSHRC_HOOKS='ln -sf "$DIR/home/.zshrc_hooks" ~/.zshrc_hooks'
LN_ZSHRC='ln -sf "$DIR/home/.zshrc" ~/.zshrc'
LN_COM='if [ -f "$DIR/home/.com" ]; then ln -sf "$DIR/home/.com" ~/.com; fi'

echo $LN_GITCONFIG
eval $LN_GITCONFIG

echo $LN_PROFILE
eval $LN_PROFILE

echo $LN_ZPROFILE
eval $LN_ZPROFILE

echo $LN_ENV
eval $LN_ENV

echo $LN_SHELL_ALIASES
eval $LN_SHELL_ALIASES

echo $LN_ZSHRC_HOOKS
eval $LN_ZSHRC_HOOKS

echo $LN_ZSHRC
eval $LN_ZSHRC

echo $LN_COM
eval $LN_COM

set +e
source ~/.zshrc
set -e

echo;

echo "Dotfiles set up successfully!"