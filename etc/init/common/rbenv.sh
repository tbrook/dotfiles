#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


. "${DOTPATH:-${HOME}/.dotfiles}"/etc/lib/vital.sh


if ! has "git"; then
    e_warning "git: command not found" >&2
    exit 1
fi



rbenv_repos="https://github.com/rbenv/rbenv.git"
rbenv_path="${HOME}/.rbenv"

ruby_build_repos="https://github.com/rbenv/ruby-build.git"
ruby_build_path="${rbenv_path}/plugins/ruby-build"



if [[ ! -e "${rbenv_path}" ]]; then
    git clone $rbenv_repos "${rbenv_path}"

    # failed
    if [[ $? != 0 ]]; then
        e_error "rbenv: fails to installation of rbenv" >&2
    fi
else
    e_warning "'${rbenv_path}' は既に存在しています"
fi


if [[ ! -e  "${ruby_build_path}" ]]; then
    git clone $ruby_build_repos "${ruby_build_path}"

    # failed
    if [[ $? != 0 ]]; then
        e_error "ruby-build: fails to installation of ruby-build" >&2
    fi
else
    e_warning "'${ruby_build_path}' は既に存在しています"
fi


# https://github.com/rbenv/ruby-build/wiki
# Ubuntu/Debian/Mint:
sudo apt install -y \
    autoconf \
    bison \
    build-essential \
    libssl-dev \
    libyaml-dev \
    libreadline6-dev \
    zlib1g-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm3 \
    libgdbm-dev \
    > /dev/null 2>&1
