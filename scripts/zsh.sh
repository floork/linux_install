#!/bin/bash

#install zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh//plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

#powerlevel10k theme
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k


cat << EOF > ~/.zshrc
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/floork/.oh-my-zsh"

# theme
ZSH_THEME="powerlevel10k/powerlevel10k"

#plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source /home/floork/.oh-my-zsh/oh-my-zsh.sh

# Load aliases and shortcuts if existent.
[ -f "/home/floork/.zsh/aliasrc" ] && source "/home/floork/.zsh/aliasrc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
EOF

echo "exec zsh" | sudo tee -a ~/.bashrc

mkdir ~/.zsh
cp ~/zsh/aliasrc ~/.zsh

#make default shell
 chsh -s /bin/zsh
 chsh -s /bin/zsh $USER
