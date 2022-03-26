#!/bin/bash

fis(){
    sudo pacman -S --noconfirm --needed fish

    #starship theme
    sudo pacman -S --noconfirm --needed starship
    yay -S --noconfirm --needed  nerd-fonts-complete-starship

    #install Oh My Fish
    curl -L https://get.oh-my.fish | fish

    #install fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    fisher install oh-my-fish/plugin-extract

    #configs    
    cp ${SCRIPT_DIR}/configs/config.fish ~/.config/fish
    cp ${SCRIPT_DIR}/configs/starship.toml ~/.config

    #Make fish default
    chsh -s /usr/bin/fish
    chsh -s /usr/bin/fish $USER
}