#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


# https://www.dropbox.com/install-linux
# https://www.xmisao.com/2013/12/17/debian-64bit-dropbox-install.html


cd "$HOME" && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -


sudo apt-get -y install nautilus-dropbox
