#!/bin/bash
sudo ln -s profile ~/.zprofile
sudo ln -s vimrc ~/.vimrc
sudo ln -s dir_colors ~/.dir_colors
if [ "$(uname)" == "Darwin" ]; then
  sudo ln -s mac_profile ~/.mac_profile
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  sudo ln -s linux_profile ~/.linux_profile
fi

