# !/bin/bash


if [[ ${full_install} == "0" ]]; then
    if [[ ${install_type} == "0" ]]; then
      cat $$HOME/pkgs/pacman-pkgs.txt | while read line
      do
        if [[ ${line} == '--END OF MINIMAL INSTALL--' ]]
        then
          # If selected installation type is FULL, skip the --END OF THE MINIMAL INSTALLATION-- line
          continue
        fi
        echo "INSTALLING: ${line}"
        sudo pacman -S --noconfirm --needed ${line}
      done
    fi
fi

if [[ ${full_install} == "1" ]]; then
    if [[ ${install_type} == "1" ]]; then
        cat $$HOME/pkgs/aur-pkgs.txt | while read line
        do
            echo "INSTALLING Yay-Packages: ${line}"
           yay -S --noconfirm --needed ${line}
        done

        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        cat $$HOME/pkgs/flatpaks.txt | while read line
        do
            echo "INSTALLING Flatpak's: ${line}"
           flatpak install -y --noninteractive flathub ${line}
        done
        #give flatpak access to themes
        sudo flatpak override --filesystem=$HOME/.themes

        cp -r $$HOME/configs/.config/* ~/.config/
        pip install konsave
        konsave -i $$HOME/configs/kde.knsv
        sleep 1
        konsave -a kde

        cp -r $$HOME/Future-black-cursors /usr/share/icons
        echo '[Icon Theme]' > /usr/share/icons/default/
        echo 'Inherits=Future-black Cursors' >> /usr/share/icons/default/

        ( bash $$HOME/scripts/zsh.sh )|& tee zsh.log
    fi
fi
