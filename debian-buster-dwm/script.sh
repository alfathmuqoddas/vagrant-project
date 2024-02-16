#!/bin/bash

echo "simple update and upgrade"
sudo apt update && sudo apt upgrade -y > /dev/null

echo "install dependecies"
sudo apt install libx11-dev libxft-dev libxinerama-dev build-essential -y > /dev/null

echo "install xorg and display manager"
sudo apt install xserver-xorg-video-radeon xserver-xorg-core lightdm lightdm-gtk-greeter pcmanfm git lxappearance xarchiver pulseaudio pavucontrol -y > /dev/null

echo "enable lightdm"
sudo systemctl enable lightdm > /dev/null

echo "cloning some repo"
echo simple-wallpaper alfath-dwm alfath-dwmstatus alfath-st1 alfath-dmenu fonts-cool yaru-look | xargs -n1 | xargs -I{} git clone https://github.com/alfathmuqoddas/{} > /dev/null

echo "copy repo font"
sudo cp -r fonts-cool/* /usr/share/fonts > /dev/null

echo "copy repo theme"
sudo cp -r yaru-look/Themes/* /usr/share/themes > /dev/null

echo "install numix icon theme"
sudo apt install numix-icon-theme -y > /dev/null

echo "installing dwm"
mkdir -p .dwm && mkdir -p /home/alfath/.dwm && cd /home/alfath/alfath-dwm && sudo make clean install && cp autostart.sh ../.dwm && sudo cp autostart.sh /root/.dwm && sudo cp dwm.desktop /usr/share/xsessions > /dev/null

echo "installing st1"
cd /home/alfath/alfath-st1 && sudo make clean install > /dev/null

echo "installing dwmstatus"
cd /home/alfath/alfath-dwmstatus && sudo make clean install > /dev/null

echo "installing dmenu"
cd /home/alfath/alfath-dmenu && sudo make clean install > /dev/null

echo "reboot"
sudo reboot
