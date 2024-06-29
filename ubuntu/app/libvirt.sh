#!/bin/bash
source $HOME/init-linux/resource/import.sh

CHECK sudo apt update && sudo apt upgrade -y
CHECK sudo apt install -y qemu-kvm qemu-system libvirt-daemon-system libvirt-daemon libvirt-dev libvirt-clients bridge-utils libosinfo-bin libguestfs-tools virt-top cloud-image-utils virtinst

# CHECK echo "user = \"$USER\"" | sudo tee -a /etc/libvirt/qemu.conf
CHECK sudo gpasswd -a $USER libvirt

CHECK echo $(colored 33 "added the libvirt group, logout and login again\n")

# virsh uri 
export LIBVIRT_DEFAULT_URI=qemu:///system

# requirement for qemu-bridge-helper
# CHECK sudo mkdir /etc/qemu
# CHECK echo '\n' > sudo tee /etc/qemu/bridge.conf
