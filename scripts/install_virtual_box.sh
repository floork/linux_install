sudo pacman -Syu
sudo pacman -S virtualbox virtualbox-guest-iso
sudo gpasswd -a $USERS vboxusers
sudo modprobe vboxdrv
yay -Syy
yay -S virtualbox-ext-oracle
sudo systemctl enable vboxweb.service
sudo systemctl start vboxweb.service
lsmod | grep -i vbox
