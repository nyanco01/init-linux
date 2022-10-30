#!/bin/bash
source $HOME/setup-sh/resource/import.sh

CHECK sudo apt install -y neovim nodejs npm
CHECK sudo npm install -g yarn

CHECK rm -rf $HOME/.config/nvim
CHECK ln -sf $SETUP_DIR/resource/config/nvim $HOME/.config/nvim

CHECK curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

CHECK curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
CHECK source ~/.bashrc
CHECK nvm install v18.12.0
