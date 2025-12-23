#!/usr/bin/env bash

CONFIG_FOLDER="dotconfig"
HOME_FOLDER="home"
LOCAL_FOLDER="dotlocal"

rm -rf ./$CONFIG_FOLDER
rm -rf ./$HOME_FOLDER

mkdir ./$CONFIG_FOLDER
mkdir ./$HOME_FOLDER

cp ~/.zprofile ./$HOME_FOLDER
cp ~/.zshrc ./$HOME_FOLDER
cp -r ~/.homebrew ./$HOME_FOLDER

cp -r ~/.config/nvim ./$CONFIG_FOLDER
cp -r ~/.config/sioyek ./$CONFIG_FOLDER
cp -r ~/.config/aerospace ./$CONFIG_FOLDER
cp -r ~/.config/wezterm ./$CONFIG_FOLDER
