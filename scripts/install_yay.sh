#install yay
#sudo pacman -Syu
#sudo pacman -S git
#cd /opt
#sudo git clone https://aur.archlinux.org/yay-git.git
#sudo chown -R floork:floork ./yay-git
#cd yay-git
#makepkg -si

#install programms
#yes Y | yay -S brave celluloid code-git dropbox github-desktop-bin github-cli pycharm-community-edition spotify timeshift htop nmon ttf-ms-fonts alacritty
yes Y |yay -S --noconfirm brave  github-cli timeshift htop ttf-ms-fonts alacritty

