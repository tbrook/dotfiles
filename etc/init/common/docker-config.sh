#!/bin/bash

# Ubuntu にインストール
# http://docs.docker.jp/engine/installation/linux/ubuntulinux.html


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


sudo gpasswd -a $USER docker

sudo service docker start

sudo systemctl enable docker
