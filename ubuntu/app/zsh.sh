#!/bin/bash
source $HOME/setup-sh/resource/import.sh

CHECK sudo apt install -y zsh
[[ `echo $SHELL | grep 'zsh'` ]] || chsh -s /bin/zsh

CHECK curl https://sh.rustup.rs -sSf | sh
CHECK source $HOME/.cargo/env
CHECK cargo install powerline-rs

