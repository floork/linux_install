#!/bin/bash

logo () {
echo -ne "

███╗   ███╗██╗   ██╗██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗
████╗ ████║╚██╗ ██╔╝██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║
██╔████╔██║ ╚████╔╝ ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║
██║╚██╔╝██║  ╚██╔╝  ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║
██║ ╚═╝ ██║   ██║   ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
╚═╝     ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝

--------------------------------------------------------------------------
                Welcome to my Post-Install Script
--------------------------------------------------------------------------
"
}

rt(){
    if [[ $USER == "root" ]]; then
        echo "Please don't run this Script as root!"
        exit
    else
        SCRIPT_DIR="$HOME/linux_install"

        installtype() {
            echo -ne "
            Please select type of installation:\n\n
            Full install: Installs full featured desktop enviroment, with added
            apps and themes needed for everyday use\n
            Minimal Install: Installs only apps few selected apps to get you
            started\n
            1) Full
            0) Minimal
            Choose an option:  "
            read -r install_type
            if [[ $install_type == "1" ]]
            then
                cat ${SCRIPT_DIR}/pkgs/pacman-pkgs.txt | while read line
                do
                    echo "INSTALLING: ${line}"
                    sudo pacman -S --noconfirm --needed ${line}
                done

                cat ${SCRIPT_DIR}/pkgs/aur-pkgs.txt | while read line
                do
                    echo "INSTALLING Yay-Packages: ${line}"
                    yay -S --noconfirm --needed ${line}
                done

                flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
                cat ${SCRIPT_DIR}/pkgs/flatpaks.txt | while read line
                do
                    echo "INSTALLING Flatpak's: ${line}"
                   flatpak install -y --noninteractive flathub ${line}
                done
                #give flatpak access to themes
                sudo flatpak override --filesystem=~/.themes
            elif [[ $install_type == "0" ]]
            then
                cat ${SCRIPT_DIR}/pkgs/pacman-pkgs.txt | while read line
                do
                  if [[ ${line} == '--END OF MINIMAL INSTALL--' ]]
                  then
                    # If selected installation type is FULL, skip the --END OF THE MINIMAL INSTALLATION-- line
                    continue
                  fi
                  echo "INSTALLING: ${line}"
                  sudo pacman -S --noconfirm --needed ${line}
                done
            else
                echo "Please use 1 or 0"
                installtype
            fi
        }

        konsa(){
            echo -ne "
            Do you want to install all KDE Configs?"
            echo -ne "
            1) ALL
            0) Only the shortcuts
            Choose an option:  " 
            read -r kon
            case ${kon} in
            1)
            cp -r ${SCRIPT_DIR}/configs/.config/* ~/.config/ 
            pip install konsave
            konsave -i ${SCRIPT_DIR}/configs/kde.knsv
            sleep 1
            konsave -a kde
            ;;
            0)
            cp -r ${SCRIPT_DIR}/configs/.config/* ~/.config/
            ;;
            *)
            echo "Please only use 1 or 0"
            konsa
            ;;
            esac
        }
        help(){
            echo -ne "
            Do you want to install customize/install the Shell"
            echo -ne "
            1) Yes, Fish
            2) Yes, Zsh
            3) Yes, Bash
            0) No
            Choose an option:  " 
            read -r hel
            case ${hel} in
            1)
            bash ${SCRIPT_DIR}/scripts/fish.sh  |& tee fish.log
            bash ${SCRIPT_DIR}/scripts/bash.sh  |& tee zsh.log
            ;;
            2)
            bash ${SCRIPT_DIR}/scripts/zsh.sh  |& tee zsh.log
            bash ${SCRIPT_DIR}/scripts/bash.sh  |& tee zsh.log
            ;;
            3)
            bash ${SCRIPT_DIR}/scripts/bash.sh  |& tee zsh.log
            ;;
            0)
            ;;
            *)
            echo "Please only use 1 or 0"
            help
            ;;
            esac
        }

        export SCRIPT_DIR 

        installtype
        konsa
        help
    
        echo "Please logout from session to see all changes!"
    fi
}

logo2(){
        echo -ne "

        ███╗   ███╗██╗   ██╗██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗
        ████╗ ████║╚██╗ ██╔╝██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║
        ██╔████╔██║ ╚████╔╝ ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║
        ██║╚██╔╝██║  ╚██╔╝  ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║
        ██║ ╚═╝ ██║   ██║   ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
        ╚═╝     ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
        -------------------------------------------------------------------------

                                        Finished!!

        -------------------------------------------------------------------------
        "
}

del(){
    echo -ne "
            Do you want to delete this script?"
            echo -ne "
            1) Yes, delete and reboot
            2) Yes, delete
            3) Only reboot
            0) No
            Choose an option:  " 
            read -r delt
            case ${delt} in
            1)
            rm -r ${SCRIPT_DIR}
            echo "Your System will Reboot in 5 seconds"
            sleep 5s
            reboot -h now
            ;;
            2)
            rm -r ${SCRIPT_DIR}
            ;;
            3)
            echo "Your System will Reboot in 5 seconds"
            sleep 5s
            reboot -h now
            ;;
            0)
            ;;
            *)
            echo "Please only use 1 or 0"
            del
            ;;
            esac
}

clear
logo
rt
logo2
del