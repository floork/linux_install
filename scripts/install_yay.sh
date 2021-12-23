#install yay
sudo pacman -Syu
sudo pacman -S git
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R floork:floork ./yay-git
cd yay-git
makepkg -si

#install programms
yay -S brave
yay -S celluloid
yay -S code-git
yay -S dropbox
yay -S github-desktop-bin
yay -S github-cli
yay -S pycharm-community-edition
yay -S spotify
yay -S timeshift
yay -S htop
yay -S nmon
yay -S alacritty
