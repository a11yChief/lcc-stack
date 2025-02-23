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
sudo zypper in -y fail2ban aide rkhunter lynis

# Add ssh jail to fail2ba

echo_bold "installing AppArmor pattern"
sudo zypper in -y -t pattern apparmor 

echo_bold "Installing nginx"
sudo zypper in -y nginx

echo_bold "Enabling nginx, will start after reboot."
sudo systemctl enable nginx

echo_bold "Installing Certbot"
sudo zypper in -y certbot python-certbot-nginx

echo_bold "Installing administration software"
sudo zypper in -y nano tmux nload ncdu

echo_bold "Copying pages from s3 bucket"
sudo aws s3 sync s3://lcc-website-bucket/ /srv/www/htdocs

echo_bold "Upgrading all system packages"
sudo zypper dup -y

echo_bold "The system has now been configured. Rebooting ..."
sudo reboot
