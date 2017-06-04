#!/bin/bash

# Ubuntu にインストール
# http://docs.docker.jp/engine/installation/linux/ubuntulinux.html


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


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



sudo apt-get -y update
sudo apt-get -y install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c "echo deb https://apt.dockerproject.org/repo ubuntu-xenial main > /etc/apt/sources.list.d/docker.list"
sudo apt-get -y update

sudo apt-get -y install linux-image-extra-$(uname -r)

sudo apt-get -y install docker-engine

sudo service docker start

# sudo usermod -aG docker ubuntu
# # sudo usermod -aG docker $USER か

sudo gpasswd -a $USER docker

sudo systemctl enable docker
