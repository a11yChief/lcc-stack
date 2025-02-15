#!/bin/bash
sudo suseconnect
sudo suseconnect -p PackageHub/15.6/aarch64
sudo zypper in -y fail2ban aide rkhunter nano tmux
sudo zypper in -y -t pattern apparmor 
sudo zypper dup -y
sudo reboot
