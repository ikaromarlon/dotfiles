## OH-MY-ZSH
ZSH_THEME="pygmalion"

# for Linux
plugins=(aliases aws colorize docker gcloud history node npm terraform vscode zsh-autosuggestions git)
# for macOS 
plugins=(aliases aws colorize docker gcloud history node npm terraform vscode zsh-autosuggestions git brew macos)

######

## CUSTOM
export PATH="$HOME/.local/bin/:$PATH"

######

## node / npm / nvm / yarn
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

######

## aws
export SAM_CLI_TELEMETRY=0

# alias awslocal="aws --endpoint-url=http://localhost:4566 $@"

######

## python
alias python=/usr/bin/python3
# alias pip=/usr/bin/pip3
