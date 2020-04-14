#!/bin/bash


#
# https://www.dropbox.com/install-linux
#


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


. "${DOTPATH:-${HOME}/.dotfiles}"/etc/lib/vital.sh



dst_dir="${HOME}"
cmd_dropbox="${dst_dir}/dropbox.py"


if builtin pushd "${dst_dir}" > /dev/null; then
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    e_newline && e_done "Install ${dst_dir}/.dropbox-dist"

    wget --output-document="${cmd_dropbox}" 'https://www.dropbox.com/download?dl=packages/dropbox.py'
    chmod 755 "${cmd_dropbox}"
    e_newline && e_done "Install ${cmd_dropbox}"

    builtin popd > /dev/null
fi
