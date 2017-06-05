#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


wget -P /tmp https://packages.chef.io/files/stable/chefdk/1.4.3/ubuntu/16.04/chefdk_1.4.3-1_amd64.deb
sudo gdebi -n /tmp/chefdk_1.4.3-1_amd64.deb && rm /tmp/chefdk_1.4.3-1_amd64.deb
