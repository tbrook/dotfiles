#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


sudo apt-get -y install ubuntu-desktop


# 再起動が必要か
