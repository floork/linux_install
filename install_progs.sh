#!/bin/bash

if [[ $USER == "root" ]]; then
    SCRIPT_DIR="/home/$SUDO_USER/linux_install"
    base="/home/$SUDO_USER"
    current=$SUDO_USER
else
    SCRIPT_DIR="$HOME/linux_install"
    base="$HOME"
    current=$USER
fi

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

cp -r $SCRIPT_DIR/configs/.config/* ${base}/.config/
        pip install konsave
        konsave -i $SCRIPT_DIR/configs/kde.knsv
        sleep 1
        konsave -a kde

bash $SCRIPT_DIR/scripts/zsh.sh  |& tee zsh.log