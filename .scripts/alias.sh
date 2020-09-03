#!/bin/bash

alias ll='ls -l --color'
alias lla='ls -al --color'
alias g='git'
alias cfe='nano ~/sources/scripts/alias.sh'
alias cfeu='source ~/.bashrc'
#alias srv='iex -S mix phoenix.server'
alias srv='npm run build:dev && npm run serve'
#alias console='iex -S mix'
alias grbc='git rebase --continue'
alias bkm='python ~/sources/scripts/bookmarks/main.py'
alias gpp='git pull && git push'
alias wall='~/sources/scripts/changeWallpaper.sh'
alias deploy='mix edeliver update --branch=dev -V && mix edeliver restart'
alias pdb='psql -U pguser -d'
alias ydl='youtube-dl -x --audio-format mp3 --audio-quality 0'
alias mbdb='mysql -u root yaelfazy_mbl'
alias npr='npm run'
alias jtest='npm run build:test && NODE_ENV=test npm run db:prepare && cross-env 
NODE_ENV=test nyc ava'

function src {
  cd "/home/blue/sources/$1"
}

function doc {
  base='https://hexdocs.pm/';
  url=''
  case $1 in
  'ecto'*)
    url=$base'ecto/Ecto.html'
    ;;
  'elixir'*)
    url=$base'elixir/Kernel.html'
    ;;
  *)
    echo 'Eh?'
    ;;
  esac
  google-chrome-stable $url
}
