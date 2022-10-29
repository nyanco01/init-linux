#!/bin/bash
source $HOME/init-linux/resource/import.sh

CHECK sudo apt update
CHECK sudo apt upgrade -y
CHECK sudo apt install -y curl git build-essential
if [ ! -d $HOME/.config ]; then
    CHECK mkdir $HOME/.config
fi
