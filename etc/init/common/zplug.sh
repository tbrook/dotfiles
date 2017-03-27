#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


. "${DOTPATH:-${HOME}/.dotfiles}"/etc/lib/vital.sh


if ! has "git"; then
    echo "git: command not found" >&2
    exit 1
fi


: "${ZPLUG_HOME:=${HOME}/.zplug}"
export ZPLUG_HOME


zplug_repos="https://github.com/zplug/zplug"


if [[ ! -e "$ZPLUG_HOME" ]]; then
    git clone $zplug_repos "$ZPLUG_HOME"

    # failed
    if [[ $? != 0 ]]; then
        echo "zplug: fails to installation of zplug" >&2
    fi
fi
