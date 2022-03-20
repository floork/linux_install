#!/bin/bash

zs{
        sudo pacman -S --noconfirm --needed zsh zsh-syntax-highlighting zsh-autosuggestions
        #install zshrc
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        exit

        #install plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh//plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

        #starship theme
        sudo pacman -S --noconfirm --needed starship


        cp ${SCRIPT_DIR}/configs/.zshrc ~/.zshrc
        cp ${SCRIPT_DIR}/configs/starship.toml ~/.config

        mkdir ~/.alias
        cp ${SCRIPT_DIR}/configs/aliasrc ~/.alias

        #make default shell
        chsh -s /bin/zsh
        chsh -s /bin/zsh $USER

zs