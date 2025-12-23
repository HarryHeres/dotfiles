#!/usr/bin/env bash

CONFIG_FOLDER="dotconfig"
LOCAL_FOLDER="dotlocal"
HOME_FOLDER="home"
USR_FOLDER="usr"

rm -rf ./$CONFIG_FOLDER
rm -rf ./$LOCAL_FOLDER
rm -rf ./$HOME_FOLDER
rm -rf ./$USR_FOLDER

mkdir -p $HOME_FOLDER
cp ~/.zshrc $HOME_FOLDER
cp ~/.zprofile $HOME_FOLDER
cp ~/.gtkrc-2.0 $HOME_FOLDER
cp ~/.gitconfig $HOME_FOLDER
cp -r ~/Icons/ $HOME_FOLDER

mkdir -p $CONFIG_FOLDER
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

mkdir -p $LOCAL_FOLDER/share/applications
cp -r ~/.local/share/applications/3D\ Slicer.desktop ./$LOCAL_FOLDER/share/applications

mkdir -p $USR_FOLDER/share/easyeffects/presets
cp -r /usr/share/easyeffects/presets ./$USR_FOLDER/share/easyeffects
