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

echo_bold "Installing apache2 and php8 mods"
sudo zypper in -y apache2 apache2-mod_php8 php8
sudo

echo_bold "Enabling apache2"
sudo systemctl enable apache2

echo_bold "Configuring apache2"
sudo a2enmod php8
sudo a2enmod rewrite

echo_bold "Installing Certbot"
sudo zypper in -y certbot python3-certbot-apache

echo_bold "Installing administration software"
sudo zypper in -y nano tmux nload ncdu

echo_bold "Copying pages from s3 bucket"
sudo mkdir /srv/www/lythamchess.com -p -v
sudo aws s3 sync s3://lcc-website-bucket/site/ /srv/www/lythamchess.com/
sudo chown -R wwwrun:www /srv/www/lythamchess.com
sudo chmod -R 755 /srv/www/lythamchess.com
sudo aws s3 sync s3://lcc-website-bucket/config/vhosts/ /etc/apache2/vhosts.d/

echo_bold "Running Certbot"
sudo certbot --apache \
  --non-interactive \
  --agree-tos \
  --redirect \
  --email info@richardhyman.com \
  -d lythamchess.com \
   -d www.lythamchess.com \
	 -d lythamchess.org \
	 -d www.lythamchess.org 

echo_bold "Starting apache2"
sudo systemctl start apache2