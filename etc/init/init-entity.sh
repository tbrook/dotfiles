#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


if [ -z "$DOTPATH" ]; then
    # shellcheck disable=SC2016
    echo '$DOTPATH not set' >&2
    exit 1
fi


init_dir="${DOTPATH}/etc/init"


if [[ ! -d "$init_dir" ]]; then
    echo "'$init_dir' はディレクトリではありません" >&2
    exit 1
fi


if [[ $# -eq 0 ]]; then
    echo -n "引数に " >&2

    find "$init_dir" -mindepth 1 -maxdepth 1 -type d |xargs -n 1 basename | while read line
    do
	echo -n "'$line', " >&2
    done

    echo "のいずれかを指定して下さい" >&2
    exit 1
fi


init_entity_dir="${init_dir}/$1"


if [[ ! -d "$init_entity_dir" ]]; then
    echo "'$init_entity_dir' はディレクトリではありません" >&2
    exit 1
fi


# Load vital library that is most important and
# constructed with many minimal functions
# For more information, see etc/README.md
. "$DOTPATH"/etc/lib/vital.sh


# Ask for the administrator password upfront
sudo -v


# Keep-alive: update existing `sudo` time stamp
#             until this script has finished
while true
do
    sudo -n true
    sleep 60;
    kill -0 "$$" || exit
done 2>/dev/null &


# shellcheck disable=SC2102
for i in "$init_entity_dir"/*.sh
do
    if [ -f "$i" ]; then
        log_info "$(e_arrow "$(basename "$i")")"
        if [ "${DEBUG:-}" != 1 ]; then
            bash "$i"
        fi
    else
        continue
    fi
done

log_pass "$0: Finish!!" | sed "s $DOTPATH \$DOTPATH g"
