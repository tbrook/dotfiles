#!/bin/bash


#
# https://www.dropbox.com/install-linux
# https://www.xmisao.com/2013/12/17/debian-64bit-dropbox-install.html
#


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu



# libatomic.so.1 が必要


## デーモンの起動

# CUI だと認証用 の URL が表示される
# ~/.dropbox-dist/dropboxd


# ~/Dropbox を予め用意する場合は 下記が必要かも
# echo fs.inotify.max_user_watches=100000 | sudo tee -a /etc/sysctl.conf; sudo sysctl -p

# ~/Dropbox を予め用意する場合は コピー後
# pushd ~/; cat /path/to/exclude-list | xargs dropbox exclude add; popd
# を行う



## dropbox の起動。上記の確認をする。exclude は起動後か？

# dropbox start
