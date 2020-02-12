#!/bin/bash


# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu


sudo -v

while true
do
    sudo -n true
    sleep 60;
    kill -0 "$$" || exit
done 2>/dev/null &


sudo apt -y install tmux
sudo apt -y install xsel
