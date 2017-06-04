#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


if which dropbox > /dev/null 2>&1; then
    cd "$HOME"

    for str in $(dropbox exclude list)
    do
	if [[ -e "$str" ]]; then
	    echo "$str"
	fi
    done
fi
