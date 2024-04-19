#!/usr/bin/env bash

CONFIG_FOLDER="dotconfig"
HOME_FOLDER="home"

rm -rf ./$CONFIG_FOLDER
rm -rf ./$HOME_FOLDER

mkdir ./$CONFIG_FOLDER 
mkdir ./$HOME_FOLDER

cp ~/.zprofile ./$HOME_FOLDER
cp ~/.zshrc ./$HOME_FOLDER
cp ~/.clangd ./$HOME_FOLDER
cp ~/.tmux.conf ./$HOME_FOLDER

cp -r ~/.config/alacritty ./$CONFIG_FOLDER
cp -r ~/.config/kitty ./$CONFIG_FOLDER
cp -r ~/.config/nvim ./$CONFIG_FOLDER
cp -r ~/.config/sioyek ./$CONFIG_FOLDER
