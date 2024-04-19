#!/usr/bin/env bash

CONFIG_FOLDER="dotconfig"
LOCAL_FOLDER="dotlocal"
VAR_FOLDER="dotvar"
HOME_FOLDER="home"
ETC_FOLDER="etc"
USR_FOLDER="usr"

rm -rf ./$CONFIG_FOLDER
rm -rf ./$LOCAL_FOLDER
rm -rf ./$VAR_FOLDER
rm -rf ./$HOME_FOLDER
rm -rf ./$ETC_FOLDER
rm -rf ./$USR_FOLDER

mkdir $CONFIG_FOLDER 

mkdir -p $LOCAL_FOLDER/share/applications

mkdir $VAR_FOLDER

mkdir -p $HOME_FOLDER

mkdir -p $ETC_FOLDER/libvirt/hooks
mkdir -p $ETC_FOLDER/pacman.d
mkdir -p $ETC_FOLDER/systemd/system

mkdir -p $USR_FOLDER/share/easyeffects/presets

cp ~/.bashrc $HOME_FOLDER
cp ~/.tmux.conf $HOME_FOLDER

cp -r ~/.config/hypr ./$CONFIG_FOLDER
cp -r ~/.config/alacritty ./$CONFIG_FOLDER
cp -r ~/.config/kitty ./$CONFIG_FOLDER
cp -r ~/.config/rofi ./$CONFIG_FOLDER
cp -r ~/.config/waybar ./$CONFIG_FOLDER
cp -r ~/.config/xsettingsd ./$CONFIG_FOLDER
cp -r ~/.config/nwg-* ./$CONFIG_FOLDER
cp -r ~/.config/dunst ./$CONFIG_FOLDER
cp -r ~/.config/systemd ./$CONFIG_FOLDER
cp -r ~/.config/sway ./$CONFIG_FOLDER
cp -r ~/.config/swaylock ./$CONFIG_FOLDER
cp -r ~/.config/nvim ./$CONFIG_FOLDER
cp -r ~/.config/neofetch ./$CONFIG_FOLDER
cp -r ~/.config/sioyek ./$CONFIG_FOLDER
cp ~/.config/rofimoji.rc ./$CONFIG_FOLDER

cp -r ~/.local/share/rofi ./$LOCAL_FOLDER/share/
cp ~/.local/share/applications/windows-vm.desktop ./$LOCAL_FOLDER/share/applications

cp -r /usr/share/easyeffects/presets ./$USR_FOLDER/share/easyeffects

cp -r ~/Wallpapers/ $HOME_FOLDER
cp -r ~/Icons/ $HOME_FOLDER 

cp -r /etc/libvirt/hooks/* ./$ETC_FOLDER/libvirt/hooks

cp /etc/pacman.d/mirrorlist ./$ETC_FOLDER

cp /etc/systemd/system/kingstonrgb.service $ETC_FOLDER/systemd/system
cp /usr/share/set_ram_rgb.sh $USR_FOLDER/share
