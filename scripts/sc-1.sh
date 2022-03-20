







clear
logo
timezone
keymaps
clear

export SCRIPT_DIR logo time_zone keymap full_install install_type
bash $SCRIPT_DIR/scripts/sc-2.sh |& tee sc-2.log  
bash $SCRIPT_DIR/scripts/sc-3.sh |& tee sc-3.log
if [[ $USER != "root" ]]; then
        bash $SCRIPT_DIR/scripts/zsh.sh  |& tee zsh.log
fi