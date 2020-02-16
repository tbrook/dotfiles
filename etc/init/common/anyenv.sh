#!/bin/bash


#
# https://github.com/anyenv/anyenv
#


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


. "${DOTPATH:-${HOME}/.dotfiles}"/etc/lib/vital.sh


if ! has "git"; then
    e_error "git: command not found" >&2
    exit 1
fi


anyenv_repos_url="https://github.com/anyenv/anyenv"
anyenv_path="${HOME}/.anyenv"

if [[ ! -e "${anyenv_path}" ]]; then
    git clone $anyenv_repos_url "${anyenv_path}"

# failed
    if [[ $? != 0 ]]; then
        e_error "anyenv: fails to installation of anyenv" >&2
	exit 1
    fi
else
    if [[ -d "${anyenv_path}" ]]; then
	e_warning "${anyenv_path}: already exist"
    else
	e_error "${anyenv_path}: is not directory"
	exit 1
    fi
fi




#
# https://github.com/znz/anyenv-update
# https://github.com/znz/anyenv-git
#


mkdir -p "${anyenv_path}/plugins"

url_dst_list=$(cat << REPOSURL_DSTDIR
https://github.com/znz/anyenv-update.git   ${anyenv_path}/plugins/anyenv-update
https://github.com/znz/anyenv-git.git      ${anyenv_path}/plugins/anyenv-git
REPOSURL_DSTDIR
	    )


echo "${url_dst_list}" | while read repos_url dst_dir
do
    if [[ ! -e "${dst_dir}" ]]; then
	git clone $repos_url "${dst_dir}"
    else
	e_warning "${dst_dir}: already exist"
    fi
done
