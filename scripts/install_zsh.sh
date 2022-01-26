#install zsh
 sudo pacman -S zsh
 chsh -s $(which zsh)

#install zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#starship theme
sh -c "$(curl -fsSL https://starship.rs/install.sh)"


sudo rm ~/.zshrc
sudo touch ~/.zshrc
echo "export ZSH="$HOME/.oh-my-zsh"" | sudo tee ~/.zshrc
echo "" | sudo tee -a ~/.zshrc
echo "#plugins" | sudo tee -a ~/.zshrc
echo "plugins=(git zsh-syntax-highlighting zsh-autosuggestions)" | sudo tee -a ~/.zshrc
echo "source $ZSH/oh-my-zsh.sh" | sudo tee -a ~/.zshrc
echo "" | sudo tee -a ~/.zshrc
echo "#alias" | sudo tee -a ~/.zshrc
echo "alias cls="clear"" | sudo tee -a ~/.zshrc
echo "alias ll="ls -alF"" | sudo tee -a ~/.zshrc
echo "alias zshrc="vim ~/.zshrc"" | sudo tee -a ~/.zshrc
echo "#theme" | sudo tee -a ~/.zshrc
echo "eval "$(starship init zsh)"" | sudo tee -a ~/.zshrc

