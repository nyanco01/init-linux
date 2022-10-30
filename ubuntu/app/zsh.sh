#!/bin/bash
source $HOME/init-linux/resource/import.sh

CHECK sudo apt install -y zsh
[[ `echo $SHELL | grep 'zsh'` ]] || chsh -s /bin/zsh

CHECK curl https://sh.rustup.rs -sSf | sh < yes 1
CHECK source $HOME/.cargo/env
CHECK cargo install powerline-rs
CHECK sudo apt install -y pkg-config libssl-dev
CHECK cargo install sheldon
CHECK yes | sheldon init --shell zsh

if [ -f $HOME/.zshrc ];then
    CHECK rm $HOME/.zshrc
fi

CHECK ln -sf $SETUP_DIR/resource/dotfiles/ubuntu.zshrc $HOME/.zshrc

CHECK rm -rf $HOME/.config/sheldon
CHECK ln -sf $SETUP_DIR/resource/config/sheldon $HOME/.config/sheldon
