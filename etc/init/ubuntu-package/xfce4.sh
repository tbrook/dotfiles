#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


sudo apt-get -y install xfce4
sudo apt-get -y install xfce4-whiskermenu-plugin
sudo apt-get -y install lightdm
sudo dpkg-reconfigure --frontend noninteractive lightdm
sudo apt-get -y install xfce4-terminal
