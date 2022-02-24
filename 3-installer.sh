 #!/bin/bash
 echo -ne "

███╗   ███╗██╗   ██╗██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗
████╗ ████║╚██╗ ██╔╝██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║
██╔████╔██║ ╚████╔╝ ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║
██║╚██╔╝██║  ╚██╔╝  ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║
██║ ╚═╝ ██║   ██║   ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
╚═╝     ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝

--------------------------------------------------------------------------
                Welcome to my Post-Install Script
--------------------------------------------------------------------------

"
#install yay for aur
# You can solve users running this script as root with this and then doing the same for the next for statement. However I will leave this up to you.
source $HOME/linux_install/setup.conf

cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ~/yay
makepkg -si --noconfirm
cd ~
git clone "https://github.com/floork/zsh.git"
cd ~/zsh
bash zsh.sh

yay -S --noconfirm --needed - < ~/linux_install/pkgs/aur-pkgs.txt

#install flatpaks
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y --noninteractive flathub <~/linux_install/pkgs/flatpaks.txt
#give flatpak access to themes
sudo flatpak override --filesystem=$HOME/.themes

#install Qemu
git clone "https://github.com/floork/my_qemu.git"
cd ~/my_qemu
bash install.sh

#configs + themes
export PATH=$PATH:~/.local/bin
cp -r ~/linux_install/dotfiles/* ~/.config/
pip install konsave
konsave -i ~/linux_install/kde.knsv
sleep 1
konsave -a kde
