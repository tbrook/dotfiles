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

if [[ ! -e "${rbenv_path}" ]]; then
    git clone $rbenv_repos "${rbenv_path}"

    # failed
    if [[ $? != 0 ]]; then
        e_error "rbenv: fails to installation of rbenv" >&2
    fi
else
    e_warning "'${rbenv_path}' は既に存在しています"
fi


ruby_build_repos="https://github.com/rbenv/ruby-build.git"
ruby_build_path="${rbenv_path}/plugins/ruby-build"

if [[ ! -e  "${ruby_build_path}" ]]; then
    git clone $ruby_build_repos "${ruby_build_path}"

    # failed
    if [[ $? != 0 ]]; then
        e_error "ruby-build: fails to installation of ruby-build" >&2
    fi
else
    e_warning "'${ruby_build_path}' は既に存在しています"
fi


rbenv_update_repos="https://github.com/rkh/rbenv-update.git"
rbenv_update_path="${rbenv_path}/plugins/rbenv-update"

if [[ ! -e  "${rbenv_update_path}" ]]; then
    git clone $rbenv_update_repos "${rbenv_update_path}"

    # failed
    if [[ $? != 0 ]]; then
        e_error "rbenv-update: fails to installation of rbenv-update" >&2
    fi
else
    e_warning "'${rbenv_update_path}' は既に存在しています"
fi


sudo -v

# https://github.com/rbenv/ruby-build/wiki
# Ubuntu/Debian/Mint:

sudo apt-get install -y \
    autoconf \
    bison \
    build-essential \
    libssl-dev \
    libyaml-dev \
    libreadline6-dev \
    zlib1g-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm5 \
    libgdbm-dev \
    > /dev/null 2>&1
