#!/bin/bash

echo "simple update and upgrade"
apt update && apt upgrade -y > /dev/null

echo "install xorg and display manager"
apt install xorg lightdm lightdm-gtk-greeter pcmanfm tint2 openbox obconf git lxappearance xarchiver -y > /dev/null

echo "enable lightdm"
systemctl enable lightdm > /dev/null

echo "cloning some repo"
echo simple-wallpaper openbox-theme tint2-theme alfath-st1 alfath-dmenu fonts-cool yaru-look | xargs -n1 | xargs -I{} git clone https://github.com/alfathmuqoddas/{} > /dev/null

echo "copy repo font"
cp -r fonts-cool/* /usr/share/fonts > /dev/null

echo "copy repo theme"
cp -r yaru-look/Themes/* /usr/share/themes && cp -r yaru-look/Icons/* /usr/share/icons > /dev/null

echo "copy repo openbox theme"
cp -r openbox-theme/* /usr/share/themes > /dev/null

#echo "copy openbox config"
#cp -r openbox-theme/openbox /etc/xdg > /dev/null

#echo "copy tint2 config"
#mkdir -p /usr/share/tint2 && cp -r tint2-theme/* /usr/share/tint2 > /dev/null

echo "installing st1"
cd /home/vagrant/alfath-st1 && mkdir -p /usr/local/bin &&
cp -f st /usr/local/bin &&
chmod 755 /usr/local/bin/st > /dev/null

echo "installing dmenu"
cd /home/vagrant/alfath-dmenu && mkdir -p /usr/local/bin && 
cp -f dmenu dmenu_path dmenu_run stest /usr/local/bin &&
chmod 755 /usr/local/bin/dmenu &&
chmod 755 /usr/local/bin/dmenu_path && 
chmod 755 /usr/local/bin/dmenu_run &&
chmod 755 /usr/local/bin/stest > /dev/null

echo "reboot"
sudo reboot