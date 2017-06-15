#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


. "${DOTPATH:-${HOME}/.dotfiles}"/etc/lib/vital.sh


if ! has "curl"; then
    e_warning "curl: command not found" >&2
    exit 1
fi


# 
curl https://sh.rustup.rs -sSf | sh


# インストール終了後 .zprofile などに ~/.cargo/env と同様の設定が書き込まれる
