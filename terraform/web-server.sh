#!/bin/bash

echo_bold() {
	local name="$1"
	echo ""
	echo -e "\033[1m$name\033[0m"
	echo ""
}

echo_bold "Registering this machine with SUSE"
sudo suseconnect

echo_bold "Adding community package hub"
sudo suseconnect -p PackageHub/15.6/aarch64

echo_bold "Registering Legacy Software Repository"
sudo suseconnect -p sle-module-legacy/15.6/aarch64

echo_bold "Installing security packages"
sudo zypper in -y fail2ban aide rkhunter lynis nano tmux

echo_bold "installing AppArmor pattern"
sudo zypper in -y -t pattern apparmor 

echo_bold "Upgrading all system packages"
sudo zypper dup -y

echo_bold "The system has now been configured. Rebooting ..."
sudo reboot
