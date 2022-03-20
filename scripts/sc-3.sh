# !/bin/bash

if [[ ${full_install} == "0" ]]; then
    if [[ ${install_type} == "0" ]]; then
      
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

        konsa(){
            echo -ne "
            Do you want to to install all KDE Configs?"
            echo -ne "
            1) ALL
            0) Only the shortcuts
            Choose an option:  " 
            read -r kon
            case ${kon} in
            1)
            cp -r $SCRIPT_DIR/configs/.config/* ${base}/.config/ 
            pip install konsave
            konsave -i $SCRIPT_DIR/configs/kde.knsv
            sleep 1
            konsave -a kde
            ;;
            0)
            cp -r $SCRIPT_DIR/configs/.config/* ${base}/.config/
            ;;
            *)
            echo "Please only use 1 or 0"
            konsa
            ;;
            esac
        }
        konsa
        else
          echo "$(tput setaf 1)$(tput setab 7)Please install the other Programms after Completion with the install_progs.sh script with no root!!$(tput sgr 0)"
          echo "the script will continue in 6 seconds"
          sleep 6s
        fi

        
    fi
fi
