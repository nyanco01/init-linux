#!/bin/bash
source $HOME/init-linux/resource/import.sh

# install neovim from source
CHECK curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -o $HOME/nvim-linux64.tar.gz
CHECK sudo rm -rf /opt/nvim
CHECK sudo tar -C /opt -xzf $HOME/nvim-linux64.tar.gz

# checking exist export row in bashrc
if [ $SHELL = '/bin/bash' ];then
	RCfile=$(cat $HOME/.bashrc)
	if [[ "$RCfile" != *opt/nvim-linux64* ]];then
		echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc
	fi
fi

# checking exist export row in zshrc
if [ $SHELL = '/bin/zsh' ];then
	RCfile=$(cat $HOME/.zshrc)
	if [[ "$RCfile" != *opt/nvim-linux64* ]];then
		echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.zshrc
	fi
fi

# install NvChad
CHECK git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
