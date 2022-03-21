#!/bin/bash
sudo pacman -S --noconfirm --needed starship
yay -S --noconfirm --needed nerd-fonts-complete-starship

cp ${SCRIPT_DIR}/configs/.bashrc ~/.bashrc
cp ${SCRIPT_DIR}/configs/starship.toml ~/.config

mkdir ~/.alias
cp ${SCRIPT_DIR}/configs/aliasrc ~/.alias