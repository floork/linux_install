#install yay
sudo pacman -Syu
sudo pacman -S git
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R tecmint:tecmint ./yay-git
cd yay-git
makepkg -si

#install programms
yay -S brave celluloid code-git dropbox github-desktop-bin github-cli pycharm-community-edition spotify timeshift htop nmon
