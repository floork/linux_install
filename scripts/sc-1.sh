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
}

keymaps () {
    echo -ne "
    Please select key board layout from this list
    us by ca cf cz de dk es et fa fi fr gr hu il it lt lv mk nl no pl ro ru sg ua uk
    "
    read keymap
    echo -ne "
    Your key boards layout: ${keymap} \n
    Is this Correct?
    1) Yes
    0) No
    "
    read -r correct_keymap

fully(){
    echo -ne "
    Do you want to install the whole script, or just to programms:
    1) FULL
    0) ONLY PROGRAMMS
    Choose an option:  "
    read -r full_install
}

installtype() {
    echo -ne "Please select type of installation:\n\n
    Full install: Installs full featured desktop enviroment, with added apps and themes needed for everyday use\n
    Minimal Install: Installs only apps few selected apps to get you started\n
    1) Full
    0) Minimal
    Choose an option:  "
    read -r install_type
    echo -ne "
    Your anwser was ${install_type} \n
    Is this Correct?
    1) Yes
    0) No
    "
    read -r correct_type
}

clear
logo
timezone
keymaps
fully
installtype


