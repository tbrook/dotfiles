#!/bin/bash


# git 自身 のリポジトリは非常に大きいので git-prompt.sh だけをインストールする


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


. "${DOTPATH:-${HOME}/.dotfiles}"/etc/lib/vital.sh



git_prompt_uri="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"


if has "curl"; then
    if [[ -d "$DOTPATH/.xbsh/rc.d/" ]]; then
	curl "$git_prompt_uri" -o "$DOTPATH/.xbsh/rc.d/git-prompt.xbsh"
    fi
elif has "wget"; then
    if [[ -d "$DOTPATH/.xbsh/rc.d/" ]]; then
	wget "$git_prompt_uri" -O "$DOTPATH/.xbsh/rc.d/git-prompt.xbsh"
    fi
else
    e_warning "'curl' or 'wget': command not found" >&2
    exit 1
fi
