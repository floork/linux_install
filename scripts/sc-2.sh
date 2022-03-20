#!/bin/bash
source $SCRIPT_DIR/configs/data

${LOGO}

if [[ ${full_install} == "1" ]]; then
    timedatectl set-ntp true
    sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
    locale-gen
    timedatectl --no-ask-password set-timezone ${TIMEZONE}
    timedatectl --no-ask-password set-ntp 1
    localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_US.UTF-8"
    ln -s /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
    # Set keymaps
    localectl --no-ask-password set-keymap ${KEYMAP}
  
    if [[ ${install_type} == "1" ]]; then
      echo -ne "
      -------------------------------------------------------------------------
                                  Numlockx
      -------------------------------------------------------------------------
      "
      echo "numlockx on" | tee -a /etc/X11/xinit/xinitrc
      echo -ne "
      -------------------------------------------------------------------------
                     Enabling (and Theming) Login Display Manager
      -------------------------------------------------------------------------
      "
      echo "[General]" > /etc/sddm.conf
      echo "Numlock=on" >> /etc/sddm.conf
    fi
fi


bash $SCRIPT_DIR/scripts/sc-3.sh |& tee sc-3.log