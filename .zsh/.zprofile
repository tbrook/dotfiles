# -*- mode: Shell-script -*-

if [ -z "$DOTPATH" ]; then
    echo "cannot start $SHELL, \$DOTPATH not set" 1>&2
    return 1
fi

. "$DOTPATH"/etc/lib/vital.sh

if ! vitalize 2>/dev/null; then
    echo "cannot vitalize, cannot start $SHELL" 1>&2
    return 1
fi


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

export EDITOR="emacsclient"

export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
export HISTSIZE=100000000
export SAVEHIST=100000000


export PATH="$HOME/.rbenv/bin:$PATH"

if has rbenv; then
    eval "$(rbenv init -)"
fi
