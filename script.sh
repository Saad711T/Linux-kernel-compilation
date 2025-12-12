#!/bin/bash
# Linux Kernel Compilation Script (Debian)
# Purpose: Compile and install a custom Linux kernel

set -e 

echo "Installing required packages"
sudo apt update
sudo apt install -y build-essential libncurses-dev bison flex libssl-dev libelf-dev bc

echo "Downloading kernel source"
cd ~
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.1.69.tar.xz
tar -xf linux-6.1.69.tar.xz
cd linux-6.1.69


echo "Loading current kernel config"
cp /boot/config-$(uname -r) .config


echo "Updating configuration"
make oldconfig


echo "Compiling kernel (using 1 core for stability)"
make -j2

sudo make modules_install

sudo make install

echo "Updating GRUB"
sudo update-grub

echo "Done!"

# sudo reboot
echo "write sudo reboot to rebooting system and using new kernel"
