#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


sudo add-apt-repository -y ppa:japaneseteam/ppa

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install ubuntu-defaults-ja
