# !/bin/bash

if [[ ${full_install} == "0" ]]; then
    if [[ ${install_type} == "0" ]]; then
      cat $SCRIPT_DIR/pkgs/pacman-pkgs.txt | while read line
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
        if [[ $USER != "root" ]]; then
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
        sudo flatpak override --filesystem=${base}/.themes

        cp -r $SCRIPT_DIR/configs/.config/* ${base}/.config/
        pip install konsave
        konsave -i $SCRIPT_DIR/configs/kde.knsv
        sleep 1
        konsave -a kde
        else
          echo "$(tput setaf 1)$(tput setab 7)Please install the other Programms after Completion with the install_progs.sh script with no root!!$(tput sgr 0)"
          echo "the script will continue in 6 seconds"
          sleep 6s
        fi

        cp -r $SCRIPT_DIR/configs/Future-black-cursors /usr/share/icons
        echo '[Icon Theme]' > /usr/share/icons/default/index.theme
        echo 'Inherits=Future-black Cursors' >> /usr/share/icons/default/index.theme
    fi
fi
