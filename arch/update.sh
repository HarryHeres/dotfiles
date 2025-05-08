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
mkdir -p $LOCAL_FOLDER/bin

mkdir $VAR_FOLDER

mkdir -p $HOME_FOLDER

mkdir -p $CONFIG_FOLDER/legendary

mkdir -p $ETC_FOLDER/pacman.d
mkdir -p $ETC_FOLDER/systemd/system

mkdir -p $USR_FOLDER/share/easyeffects/presets

cp ~/.zshrc $HOME_FOLDER
cp ~/.zprofile $HOME_FOLDER
cp ~/.tmux.conf $HOME_FOLDER
cp ~/.gtkrc-2.0 $HOME_FOLDER
cp ~/.gitconfig $HOME_FOLDER

cp -r ~/Wallpapers/ $HOME_FOLDER
cp -r ~/Icons/ $HOME_FOLDER

cp -r ~/.config/alacritty ./$CONFIG_FOLDER
cp -r ~/.config/wezterm ./$CONFIG_FOLDER
cp -r ~/.config/fontconfig ./$CONFIG_FOLDER
cp -r ~/.config/dunst ./$CONFIG_FOLDER
cp -r ~/.config/hypr ./$CONFIG_FOLDER
cp -r ~/.config/nautilus ./$CONFIG_FOLDER
cp -r ~/.config/nvim ./$CONFIG_FOLDER
cp -r ~/.config/nwg-* ./$CONFIG_FOLDER
cp -r ~/.config/rofi ./$CONFIG_FOLDER
cp -r ~/.config/systemd ./$CONFIG_FOLDER
cp -r ~/.config/swaylock ./$CONFIG_FOLDER
cp -r ~/.config/sioyek ./$CONFIG_FOLDER
cp -r ~/.config/waybar ./$CONFIG_FOLDER
cp -r ~/.config/xsettingsd ./$CONFIG_FOLDER

cp ~/.config/rofimoji.rc ./$CONFIG_FOLDER
cp ~/.config/legendary/config.ini ./$CONFIG_FOLDER/legendary

cp -r ~/.local/share/rofi ./$LOCAL_FOLDER/share/
cp -r ~/.local/share/applications/3D\ Slicer.desktop ./$LOCAL_FOLDER/share/applications

cp -r /usr/share/easyeffects/presets ./$USR_FOLDER/share/easyeffects

cp /etc/systemd/system/kingstonrgb.service ./$ETC_FOLDER/systemd/system
cp /usr/share/set_ram_rgb.sh ./$USR_FOLDER/share

cp ~/.local/bin/tmux-sessionizer.sh ./$LOCAL_FOLDER/bin
