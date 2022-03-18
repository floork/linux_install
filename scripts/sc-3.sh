# !/bin/bash

cat $SCRIPT_DIR/pkgs/pacman-pkgs.txt | while read line
do
    echo "INSTALLING: ${line}"
   sudo pacman -S --noconfirm --needed ${line}
done

sed -n '/'$INSTALL_TYPE'/q;p' $SCRIPT_DIR/pkgs/pacman-pkgs.txt | while read line
do
  if [[ ${line} == '--END OF MINIMAL INSTALL--' ]]
  then
    # If selected installation type is FULL, skip the --END OF THE MINIMAL INSTALLATION-- line
    continue
  fi
  echo "INSTALLING: ${line}"
  sudo pacman -S --noconfirm --needed ${line}
done

if [[ $INSTALL_TYPE == "FULL" ]]; then
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
    sudo flatpak override --filesystem=$HOME/.themes

    cp -r $SCRIPT_DIR/configs/.config/* ~/.config/
    pip install konsave
    konsave -i $SCRIPT_DIR/configs/kde.knsv
    sleep 1
    konsave -a kde

    cp -r $SCRIPT_DIR/Future-black-cursors /usr/share/icons
    echo '[Icon Theme]' > /usr/share/icons/default/
    echo 'Inherits=Future-black Cursors' >> /usr/share/icons/default/

    ( bash $SCRIPT_DIR/scripts/zsh.sh )|& tee zsh.log
fi