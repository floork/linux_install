cd ./scripts_ubun_de
./apt_install.sh
./qemu_deb.sh

cd ..

#global scripts
cd ./global_scripts
./de_keyboard.sh
./de_locale.sh
./fix_dhcp.sh
./install_flatpak_und_programms.sh
./install_zsh.sh