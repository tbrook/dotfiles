#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


. "${DOTPATH:-${HOME}/.dotfiles}"/etc/lib/vital.sh



### 
data_dir="${HOME}/data"

if [[ ! -e "${data_dir}" ]]; then
    # /mnt/data が存在しなくても実行する
    ln -s /mnt/data "${data_dir}"
fi



### 
software_path="${SOFTWARE_PATH:-${HOME}/software-space}"

if [[ ! -e "$software_path"  ]]; then
    sw_basename="$(basename "$software_path")"

    for sw_dir in \
	"${HOME}/var" \
	"${HOME}/Dropbox" \
	"/dropbox" \
	"/Dropbox"
    do
	sw_path="${sw_dir}/${sw_basename}"

	if [[ -e "${sw_path}" ]]; then
	    ln -s "${sw_path}" "${software_path}"
	    break
	fi
    done
fi

