#!/bin/bash

cat $SCRIPT_DIR/pkgs/aur-pkgs.txt | while read line
do
    echo "INSTALLING Yay-Packages: ${line}"
   yay -S --noconfirm --needed ${line}
done

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
cat $SCRIPT_DIR/pkgs/flatpaks.txt | while read line
do
    echo "INSTALLING Flatpak's: ${line}"
   flatpak install -y --noninteractive flathub ${line}
done
#give flatpak access to themes
sudo flatpak override --filesystem=~/.themes

bash $SCRIPT_DIR/scripts/zsh.sh  |& tee zsh.log