## OH-MY-ZSH
ZSH_THEME="pygmalion"

# for Linux
plugins=(aliases aws colorize docker gcloud history node npm terraform vscode zsh-autosuggestions git)
# for macOS 
plugins=(aliases aws colorize docker gcloud history node npm terraform vscode zsh-autosuggestions git brew macos)

# put this command before source oh-my-zsh.sh (temporary workaround)
zstyle ':omz:alpha:lib:git' async-prompt no

######

# CUSTOM: load environment vars
if [ -f "$HOME/.env" ]; then
  source "$HOME/.env"
fi

# CUSTOM: load command aliases
if [ -f "$HOME/.bash_aliases" ]; then
  . "$HOME/.bash_aliases"
fi

# CUSTOM: other

export PATH="$HOME/.local/bin/:$PATH"

# node / npm / nvm / yarn
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
