#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export SCRIPT_DIR

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

sys (){
    echo -ne "
        What Distro do you use?"
    echo -ne "
        1) Arch
        2) Fedora
        0) Ubuntu/Debian
        Choose an option:   "
        read -r distro
        case ${distro} in
        1) 
            bash ${SCRIPT_DIR}/scripts/arch.sh
        ;;
        2)
            bash ${SCRIPT_DIR}/scripts/fedora.sh
        ;;
        0)
            bash ${SCRIPT_DIR}/scripts/debian.sh
        ;;
        *)
            echo "Please only use 1 or 0"
            sys
        ;;
        esac
}

konsa(){
        echo -ne "
        Do you want to install all KDE Configs?"
        echo -ne "
        1) ALL
        2) Only the shortcuts
        0) Do nothing
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
        2)
            cp -r ${SCRIPT_DIR}/configs/.config/* ~/.config/
        ;;
        0)
        ;;
        *)
            echo "Please only use 1 or 0"
            konsa
        ;;
        esac
    }

shell(){
        curl -sS https://starship.rs/install.sh | sh
        git clone https://github.com/floork/my_shell
        cd my_shell
        bash "install.sh"
        cd $SCRIPT_DIR
        clear
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
        2) Only delete
        3) Only reboot
        0) No
        Choose an option:  "
        read -r delt
        case ${delt} in
        1)
            rm -r ${SCRIPT_DIR}
            echo "Your System will Reboot in 5 seconds"
            sleep 5s
            sudo reboot -h now
        ;;
        2)
            rm -r ${SCRIPT_DIR}
        ;;
        3)
            echo "Your System will Reboot in 5 seconds"
            sleep 5s
            sudo reboot -h now
        ;;
        0)
        ;;
        *)
            echo "Please only use 1 or 0"
            del
        ;;
        esac
    }

logo
sys
konsa
shell
logo2
del