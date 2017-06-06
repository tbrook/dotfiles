#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


# グループ local-data の グループ ID を 12311 に固定する
sudo groupadd -g 12311 local-data

sudo gpasswd -a $USER local-data
