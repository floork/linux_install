#!/bin/bash

#install zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh//plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

#powerlevel10k theme
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k


cp ~/linux_install/config/.zshrc ~/.zshrc
echo "exec zsh" | sudo tee -a ~/.bashrc

mkdir ~/.zsh
cp ~/linux_install/config/aliasrc ~/.zsh

#make default shell
 chsh -s /bin/zsh
 chsh -s /bin/zsh $USER
