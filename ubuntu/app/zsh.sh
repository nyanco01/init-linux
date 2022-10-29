#!/bin/bash
source $HOME/init-linux/resource/import.sh

CHECK sudo apt install -y zsh
[[ `echo $SHELL | grep 'zsh'` ]] || chsh -s /bin/zsh

CHECK curl https://sh.rustup.rs -sSf | sh
CHECK source $HOME/.cargo/env
CHECK cargo install powerline-rs
CHECK sudo apt install -y pkg-config
CHECK cargo install sheldon
CHECK sheldon init --shell zsh

