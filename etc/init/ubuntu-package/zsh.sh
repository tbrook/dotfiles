#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


sudo apt-get -y install zsh
sudo apt-get -y install zsh-doc
sudo apt-get -y install zsh-lovers
