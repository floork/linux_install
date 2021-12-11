 #install snap
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

#install snap-store
sudo snap install snap-store

#install snap programms
sudo snap install whatsapp-for-linux
