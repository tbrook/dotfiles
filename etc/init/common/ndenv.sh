#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


. "${DOTPATH:-${HOME}/.dotfiles}"/etc/lib/vital.sh


if ! has "git"; then
    e_warning "git: command not found" >&2
    exit 1
fi





ndenv_repos="https://github.com/riywo/ndenv"
ndenv_path="${HOME}/.ndenv"

if [[ ! -e "${ndenv_path}" ]]; then
    git clone $ndenv_repos "${ndenv_path}"

    # failed
    if [[ $? != 0 ]]; then
        e_error "ndenv: fails to installation of ndenv" >&2
    fi
else
    e_warning "'${ndenv_path}' は既に存在しています"
fi


node_build_repos="https://github.com/riywo/node-build.git"
node_build_path="${ndenv_path}/plugins/node-build"

if [[ ! -e  "${node_build_path}" ]]; then
    git clone $node_build_repos "${node_build_path}"

    # failed
    if [[ $? != 0 ]]; then
        e_error "node-build: fails to installation of node-build" >&2
    fi
else
    e_warning "'${node_build_path}' は既に存在しています"
fi
