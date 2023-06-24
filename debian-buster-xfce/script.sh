#!/bin/bash

echo "simple update and upgrade"
apt update && apt upgrade -y > /dev/null

echo "install xfce4, xfce4-goodies, and some app"
apt install xfce4 xfce4-goodies git firefox-esr -y > /dev/null

echo "enable lightdm"
systemctl enable lightdm > /dev/null

echo "cloning some repo"
echo simple-wallpaper fonts-cool yaru-look | xargs -n1 | xargs -I{} git clone https://github.com/alfathmuqoddas/{} > /dev/null

echo "copy repo font"
cp -r fonts-cool/* /usr/share/fonts > /dev/null

echo "copy repo theme"
cp -r yaru-look/Themes/* /usr/share/themes > /dev/null

echo "install numix icon theme"
apt install numix-icon-theme -y > /dev/null

echo "reboot"
sudo reboot