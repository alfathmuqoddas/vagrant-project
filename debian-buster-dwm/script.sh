#!/bin/bash

echo "simple update and upgrade"
apt update && apt upgrade -y > /dev/null

echo "install dependecies"
apt install libx11-dev libxft-dev libxinerama-dev build-essential -y > /dev/null

echo "install xorg and display manager"
apt install xserver-xorg-video-radeon xserver-xorg-core lightdm lightdm-gtk-greeter pcmanfm firefox-esr git lxappearance xarchiver pulseaudio pavucontrol -y > /dev/null

echo "enable lightdm"
systemctl enable lightdm > /dev/null

echo "cloning some repo"
echo simple-wallpaper alfath-dwm alfath-dwmstatus alfath-st1 alfath-dmenu fonts-cool yaru-look | xargs -n1 | xargs -I{} git clone https://github.com/alfathmuqoddas/{} > /dev/null

echo "copy repo font"
cp -r fonts-cool/* /usr/share/fonts > /dev/null

echo "copy repo theme"
cp -r yaru-look/Themes/* /usr/share/themes > /dev/null

echo "install numix icon theme"
apt install numix-icon-theme -y > /dev/null

echo "installing dwm"
mkdir -p .dwm && mkdir -p /home/vagrant/.dwm && cd /home/vagrant/alfath-dwm && make clean install && cp autostart.sh ../.dwm && cp autostart.sh /root/.dwm && cp dwm.desktop /usr/share/xsessions > /dev/null

echo "installing st1"
cd /home/vagrant/alfath-st1 && make clean install > /dev/null

echo "installing dwmstatus"
cd /home/vagrant/alfath-dwmstatus && make clean install > /dev/null

echo "installing dmenu"
cd /home/vagrant/alfath-dmenu && make clean install > /dev/null

echo "reboot"
sudo reboot