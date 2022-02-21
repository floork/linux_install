#!bin/bash

#ad flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#install programms
while read list;
do flatpak install -y --noninteractive flathub $list;
done < ~/linux_install/scripts/global_scripts/flatpak_list.txt

#give access to themes
sudo flatpak override --filesystem=$HOME/.themes
