#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu



tb.conf.eww () {
    eww_bm_name="eww-bookmarks"

    eww_bm_file="${SOFTWARE_PATH}/var/emacs/${eww_bm_name}"

    mkdir -p "${eww_bm_file%/*}"

    if [[ -f "$eww_bm_file" ]]; then
	if builtin pushd "${HOME}/.emacs.d" > /dev/null; then
	    if [[ -e "$eww_bm_name" ]]; then

		mv --backup=numbered "$eww_bm_name" "${eww_bm_name}.orig"
	    fi

	    ln -s "$eww_bm_file" .

	    builtin popd > /dev/null
	fi
    fi
}


git clone ssh://git@bitbucket.org/tbrook/dot.emacs.d.git "${HOME}/.emacs.d"

tb.conf.eww
