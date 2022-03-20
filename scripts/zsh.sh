#!/bin/bash

zs{
        echo -ne "
        Do you want to install zsh?
        1) Yes
        0) No"
        read -r zh
        case ${zh} in
        1)
        #install zshrc
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        exit

        #install plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh//plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

        #powerlevel10k theme
        git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k


        cp ${SCRIPT_DIR}/configs/.zshrc ~/.zshrc
        echo "exec zsh" | sudo tee -a ~/.bashrc

        mkdir ~/.zsh
        cp ${SCRIPT_DIR}/configs/aliasrc ~/.zsh

        #make default shell
        chsh -s /bin/zsh
        chsh -s /bin/zsh $current
        ;;
        0)
        echo "oK"
        ;;
        *)
        echo "Please use 1 or 0"
        zs
        ;;
}

zs