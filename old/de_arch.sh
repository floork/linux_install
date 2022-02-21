cd ./scripts_arch_de
./pacman_programm_list.sh
./install_yay.sh
./qemu.sh

cd ..

#global scripts
cd ./global_scripts
./de_keyboard.sh
./de_locale.sh
./fix_dhcp.sh
./install_flatpak_und_programms.sh
./install_zsh.sh