sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat
sudo pacman -S ebtables iptables
sudo pacman -S libguestfs
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
yay -S dmidecode
sudo systemctl restart libvirtd
sudo virsh net-start default
sudo virsh net-autostart default
sudo adduser $USERS libvirtd
sudo adduser $USERS libvirtd-qemu
