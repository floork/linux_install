#!/bin/bash

/scripts_ubun_en
sh /apt_install.sh
sh /qemu_deb.sh

#global scripts
/global_scripts
sh /de_keyboard.sh
sh /de_locale.sh
sh /fix_dhcp.sh
sh /install_flatpak_und_programms.sh
sh /install_zsh.sh