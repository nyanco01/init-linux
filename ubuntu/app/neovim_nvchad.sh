#!/bin/bash
source $HOME/init-linux/resource/import.sh

# install neovim from source
CHECK curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -o $HOME/nvim-linux64.tar.gz
CHECK sudo rm -rf /opt/nvim
CHECK sudo tar -C /opt -xzf $HOME/nvim-linux64.tar.gz

# add symbolic link
CHECK sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/bin/nvim

# remove tar file
CHECK rm $HOME/nvim-linux64.tar.gz

# install NvChad
CHECK git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
