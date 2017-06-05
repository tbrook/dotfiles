#!/bin/bash

# Ubuntu にインストール
# http://docs.docker.jp/engine/installation/linux/ubuntulinux.html


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


if which docker > /dev/null 2>&1; then
    echo "'${USER}' を docker グループに追加します。パスワードを入力して下さい"
    sudo gpasswd -a $USER docker

    sudo systemctl enable docker
    sudo systemctl restart docker
fi
