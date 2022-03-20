#!/bin/bash

if [[ ${full_install} == "1" ]]; then
    if [[  ==${install_type} "1" ]]; then
        #install zshrc
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

        #install plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions.git ${base}/.oh-my-zsh//plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${base}/.oh-my-zsh/plugins/zsh-syntax-highlighting

        #powerlevel10k theme
        git clone https://github.com/romkatv/powerlevel10k.git ${base}/.oh-my-zsh/custom/themes/powerlevel10k


        cp ${SCRIPT_DIR}/configs/.zshrc ${base}/.zshrc
        echo "exec zsh" | sudo tee -a ${base}/.bashrc

        mkdir ${base}/.zsh
        cp ${SCRIPT_DIR}/configs/aliasrc ${base}/.zsh

        #make default shell
        chsh -s /bin/zsh
        chsh -s /bin/zsh $current
    fi
fi