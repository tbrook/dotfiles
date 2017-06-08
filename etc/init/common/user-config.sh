#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


. "${DOTPATH:-${HOME}/.dotfiles}"/etc/lib/vital.sh


# 
tb.gen_symlink() {
    # 第3引数は 相対パスでシンボリックリンクを作成するなど用で、
    # シンボリックリンクを置くディレクトリを指定する

    if [[ ! $# -ge 2 ]]; then
	echo "引数を2つ以上指定して下さい。src_dir  dst_dir  (target_dir)" >&2
	return 1
    fi

    src_dir=$1
    dst_dir=$2
    
    if [[ $# -ge 3 ]]; then
	target_dir="$3"
    else
	target_dir="$(pwd)"
    fi


    if builtin pushd "$target_dir" > /dev/null; then
	if [[ ! -e "$dst_dir"  ]]; then
	    ln -s "$src_dir" "$dst_dir"
	fi
	builtin popd > /dev/null
    fi
}




### 
data_dir="${HOME}/data"

# /mnt/data が存在しなくてもシンボリックリンクを作成する
tb.gen_symlink  /mnt/data  "${data_dir}"




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




###
var_dir="${HOME}/var"

if [[ ! -e "$var_dir"  ]]; then
    mkdir "$var_dir"
fi


tb.gen_symlink  "${HOME}/Dropbox"  "${var_dir}/Dropbox"
tb.gen_symlink  "${HOME}/software-space"  "${var_dir}/software-space"

tb.gen_symlink  "Dropbox/data/vagrant"  "vagrant"  "$var_dir"
tb.gen_symlink  "software-space/repos"  "repos"  "$var_dir"




### 
xdg_user_dirs="${data_dir}/Xdg-user-dirs"

if [[ -d "$xdg_user_dirs" ]]; then
    for dir_name in \
	Desktop \
	Documents \
	Downloads \
	Music \
	Pictures \
	Public \
	Templates \
	Videos
    do
	dst_dir="${xdg_user_dirs}/${dir_name}"

	if [[ -d "$dst_dir" ]]; then
	    src_dir="${HOME}/${dir_name}"

	    if [[ -e "$src_dir" ]]; then
		mv "$src_dir" "${src_dir}.orig"
	    fi

	    ln -s "$dst_dir" "$src_dir"
	fi
    done
fi

LANG=C xdg-user-dirs-update
