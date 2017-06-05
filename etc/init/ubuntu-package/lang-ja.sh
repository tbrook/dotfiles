#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


sudo apt-get -y install language-pack-ja
sudo apt-get -y install language-pack-ja-base

sudo update-locale LANG=ja_JP.UTF-8
