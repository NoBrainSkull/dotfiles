autoload -U compinit; compinit
eval "$(starship init zsh)"

# Sheldon (rust version manager)
eval "$(sheldon source)"

# NVM (node version manager)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# ASDF (the last version manager)
. /opt/asdf-vm/asdf.sh

## ZSH OPTIONS
#setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt extended_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST
setopt INC_APPEND_HISTORY

## KEYS
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^[[F" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char

## ALIASES
alias config="cd ~/.config"
alias g=git
alias y=yarn
alias docomp=docker-compose
alias v=nvim
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
