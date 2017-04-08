#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


. "${DOTPATH:-${HOME}/.dotfiles}"/etc/lib/vital.sh


if [[ ! -e "${SOFTWARE_PATH:-}"  ]]; then
    sw_basename="$(basename $SOFTWARE_PATH)"

    for sw_dir in \
	"${HOME}/var" \
	"${HOME}/Dropbox" \
	"/dropbox" \
	"/Dropbox"
    do
	sw_path="${sw_dir}/${sw_basename}"

	if [[ -e "${sw_path}" ]]; then;
	    ln -s "$sw_path" "${SOFTWARE_PATH}"
	    break
	fi
    done
fi
