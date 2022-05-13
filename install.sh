#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

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
    if [ -x "$(command -v pacman)" ];then
        bash ${SCRIPT_DIR}/scripts/arch.sh
        elif [ -x "$(command -v dnf)" ];then
        bash ${SCRIPT_DIR}/scripts/fedora.sh
        elif [ -x "$(command -v apt-get)" ];then
        bash ${SCRIPT_DIR}/scripts/debian.sh
    else
        echo 'This Distro is not supported!'
    fi
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
            sudo cp -r ${SCRIPT_DIR}/configs/.config/* ~/.config/
            sudo cp ${SCRIPT_DIR}/configs/index.theme /usr/share/icons/default/
            sudo cp ${SCRIPT_DIR}/configs/settings.ini ${HOME}/.config/gtk-3.0/
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

export SCRIPT_DIR

logo
sys
konsa
shell
logo2
del
