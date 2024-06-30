#!/bin/bash
source $HOME/init-linux/resource/import.sh

CHECK sudo apt update && sudo apt upgrade -y
CHECK sudo apt install -y qemu-kvm qemu-system libvirt-daemon-system libvirt-daemon libvirt-dev libvirt-clients bridge-utils libosinfo-bin libguestfs-tools virt-top cloud-image-utils virtinst

# CHECK echo "user = \"$USER\"" | sudo tee -a /etc/libvirt/qemu.conf
CHECK sudo gpasswd -a $USER libvirt

CHECK echo $(colored 33 "added the libvirt group, logout and login again\n")

# set virsh uri for bash
if [ $SHELL = '/bin/bash' ];then
	RCfile=$(cat $HOME/.bashrc)
	if [[ "$RCfile" != *LIBVIRT_DEFAULT_URI* ]];then
		echo 'export LIBVIRT_DEFAULT_URI=qemu:///system"' >> ~/.bashrc
	fi
fi

# set virsh uri for zsh
if [ $SHELL = '/bin/zsh' ];then
	RCfile=$(cat $HOME/.zshrc)
	if [[ "$RCfile" != *LIBVIRT_DEFAULT_URI* ]];then
		echo 'export LIBVIRT_DEFAULT_URI=qemu:///system"' >> ~/.zshrc
	fi
fi




# requirement for qemu-bridge-helper
# CHECK sudo mkdir /etc/qemu
# CHECK echo '\n' > sudo tee /etc/qemu/bridge.conf
