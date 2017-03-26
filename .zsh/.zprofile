# -*- mode: Shell-script -*-

export LANG=ja_JP.UTF-8

export LESS='-g -i -M -R -S -w -X -z-4'
export LESSOPEN='| /usr/bin/lesspipe %s'
export PAGER=less

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;44;37m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
export HISTSIZE=100000000
export SAVEHIST=100000000
