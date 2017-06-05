#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


# https://www.dropbox.com/install-linux
# https://www.xmisao.com/2013/12/17/debian-64bit-dropbox-install.html


# deamon start
# CUI だと認証用 の URL が表示される
"$HOME/.dropbox-dist/dropboxd" && dropbox stop


# ~/Dropbox を予めコピーしたい場合、コピー後
# pushd ~/; cat /path/to/exclude-list | xargs dropbox exclude add; popd
# を行う


# dropbox start
