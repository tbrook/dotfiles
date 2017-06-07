#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


git clone ssh://git@bitbucket.org/tbrook/dot.emacs.d.git "${HOME}/.emacs.d"
