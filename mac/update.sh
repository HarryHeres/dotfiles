#!/usr/bin/env bash

CONFIG_FOLDER="dotconfig"
HOME_FOLDER="home"
LOCAL_FOLDER="dotlocal"

rm -rf ./$CONFIG_FOLDER
rm -rf ./$HOME_FOLDER
rm -rf ./$LOCAL_FOLDER

mkdir ./$CONFIG_FOLDER 
mkdir ./$HOME_FOLDER
mkdir -p ./$LOCAL_FOLDER/bin

cp ~/.zprofile ./$HOME_FOLDER
cp ~/.zshrc ./$HOME_FOLDER
cp ~/.tmux.conf ./$HOME_FOLDER
cp -r ~/.homebrew ./$HOME_FOLDER

cp -r ~/.config/alacritty ./$CONFIG_FOLDER
cp -r ~/.config/nvim ./$CONFIG_FOLDER
cp -r ~/.config/sioyek ./$CONFIG_FOLDER
cp -r ~/.config/yabai ./$CONFIG_FOLDER
cp -r ~/.config/skhd ./$CONFIG_FOLDER
cp -r ~/.config/aerospace ./$CONFIG_FOLDER

cp ~/.local/bin/tmux-sessionizer.sh ./$LOCAL_FOLDER/bin
