#!/bin/bash
source $HOME/init-linux/resource/import.sh

CHECK echo "\$nrconf{restart} = 'a';" | sudo tee /etc/needrestart/conf.d/50local.conf

CHECK sudo apt update
CHECK sudo apt upgrade -y
CHECK sudo apt install -y curl git build-essential
if [ ! -d $HOME/.config ]; then
    CHECK mkdir $HOME/.config
fi
