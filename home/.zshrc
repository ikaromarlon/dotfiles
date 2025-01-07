## OH-MY-ZSH
ZSH_THEME="pygmalion"

# for Linux
plugins=(aliases aws colorize docker gcloud git history node npm terraform vscode zsh-autosuggestions)
# for macOS 
plugins=(aliases aws brew colorize docker gcloud git history macos node npm terraform vscode zsh-autosuggestions)

# put this command before source oh-my-zsh.sh (temporary workaround)
zstyle ':omz:alpha:lib:git' async-prompt no

######

# CUSTOM: load environment vars
if [ -f "$HOME/.env" ]; then
  . "$HOME/.env"
fi

# CUSTOM: load command aliases
if [ -f "$HOME/.shell_aliases" ]; then
  . "$HOME/.shell_aliases"
fi

# CUSTOM: other

export PATH="$HOME/.local/bin/:$PATH"

# CUSTOM: node / npm / nvm / yarn
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# CUSTOM: load zsh hooks (place always at the end of .zshrc)
if [ -f "$HOME/.zshrc_hooks" ]; then
  . "$HOME/.zshrc_hooks"
fi