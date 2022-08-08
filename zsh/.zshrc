
# EDITOR
export EDITOR=nvim

# HISTORY
export HISTFILE=~/.histfile
export HISTSIZE=1000000000
export SAVEHIST=1000000000

setopt extended_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_expire_dups_first
setopt extended_history
setopt append_history
setopt inc_append_history

# ASDF
. /opt/asdf-vm/asdf.sh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zsh-users/zsh-syntax-highlighting \
    light-mode pick"async.zsh" src"pure.zsh" \
                sindresorhus/pure


### End of Zinit's installer chunk

zplugin light zsh-users/zsh-autosuggestions

# Plugin history-search-multi-word loaded with tracking.
#zplugin load zdharma/history-search-multi-word
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
zplugin ice silent wait:1; zplugin light lukechilds/zsh-nvm
zplugin light zsh-users/zsh-history-substring-search

alias g=git
alias y=yarn
alias sysup="paru -Syu --noconfirm"

# Custom key binding
bindkey '^[[A' 		history-substring-search-up
bindkey '^[[B' 		history-substring-search-down
bindkey '^[[H' 		beginning-of-line
bindkey '^[[F' 		end-of-line
bindkey '^[[1;5C' 	forward-word
bindkey '^[[1;5D' 	backward-word

# restore wal scheme color
wal -R -n -q

# Custom envars
export ERL_AFLAGS="-kernel shell_history enabled" # Iex (erl) history
export PATH="/home/no_brain_skull/.local/bin:$PATH"
export PATH="/home/no_brain_skull/.cache/rebar3/bin:$PATH"
