#!/bin/bash


#
# https://help.dropbox.com/ja-jp/installs-integrations/desktop/linux-commands
#


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu



sudo sh -c "echo deb https://linux.dropbox.com/ubuntu $(lsb_release -c -s) main > /etc/apt/sources.list.d/dropbox.list"

sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E


sudo apt -y update

sudo apt -y install nautilus-dropbox

# libatomic.so.1 が dropbox 実行時に必要になる
sudo apt install libatomic1
