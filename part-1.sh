#!/bin/bash

if [[ $USER == "root" ]]; then
    SCRIPT_DIR="/home/$SUDO_USER/linux_install"
    base="/home/$SUDO_USER"
    current=$SUDO_USER
else
    echo "Please run this script as root!"
fi

if [[ $USER == "root" ]]; then
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

    timezone () {
        # Added this from arch wiki https://wiki.archlinux.org/title/System_time
        time_zone="$(curl --fail https://ipapi.co/timezone)"
        echo -ne "
        System detected your timezone to be '$time_zone' \n"
        echo -ne "
        Is this correct?
        1) Yes
        0) No
        Choose an option:  " 
        read -r time_zone
        case time_zone in
        1)
        timedatectl set-ntp true
        sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
        locale-gen
        timedatectl --no-ask-password set-timezone ${TIMEZONE}
        timedatectl --no-ask-password set-ntp 1
        localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_US.UTF-8"
        ln -s /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
        ;;
        0)
        timezone
        ;;
        *)
        echo "Please only use 1 or 0"
        timezone
        ;;
        esac
    }

    keymaps () {
        echo -ne "
        Please select key board layout from this list:

        us by ca cf cz de dk es et fa fi fr gr hu il it lt lv mk nl no pl ro ru sg ua uk
        Choose an option:  "
        read keymap
        echo -ne "
        Your key boards layout: ${keymap} \n
        Is this Correct?
        1) Yes
        0) No
        Choose an option:  "
        read -r correct_keymap
        case ${correct_keymap} in
        1)
        # Set keymaps
        localectl --no-ask-password set-keymap ${KEYMAP}
        ;;
        0)
        keymaps
        ;;
        *)
        echo "Please only use 1 or 0"
        keymaps
        ;;
        esac
    }

    numlock(){
        echo -ne "
        Do you want to use Numlockx?
        1) Yes
        0) No
        Choose an option: "
        read -r numlockx
        case ${numlockx} in
        1)
        echo -ne "
        -------------------------------------------------------------------------
                                    Numlockx
        -------------------------------------------------------------------------
        "
        echo "numlockx on" /etc/X11/xinit/xinitrc
        echo "[General]" | tee /etc/sddm.conf
        echo "Numlock=on" | tee -a /etc/sddm.conf
        ;;
        0)
        ;;
        *)
        echo "Please only use 1 or 0"
        keymaps
        ;;
        esac
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
    clear
    logo
    timezone
    keymaps
    numlock
    logo2

    echo "Your System will Reboot in 5 seconds"
    sleep 5s
    reboot -h now
fi  