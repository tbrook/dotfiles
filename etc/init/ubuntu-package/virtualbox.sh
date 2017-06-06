#!/bin/bash

# https://www.virtualbox.org/wiki/Linux_Downloads


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu



sudo sh -c "echo deb http://download.virtualbox.org/virtualbox/debian xenial contrib > /etc/apt/sources.list.d/virtualbox.list"

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

sudo apt-get -y update
sudo apt-get -y install virtualbox-5.1

sudo apt-get -y install dkms
