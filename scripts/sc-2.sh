#!/bin/bash

if [[ ${full_install} == "FULL" ]]; then
  iso=$(curl -4 ifconfig.co/country-iso)
  timedatectl set-ntp true
  pacman -S --noconfirm archlinux-keyring #update keyrings to latest to prevent packages failing to install
  pacman -S --noconfirm --needed pacman-contrib terminus-font
  setfont ter-v22b
  sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
  pacman -S --noconfirm --needed reflector rsync grub
  cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
  sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
  locale-gen
  timedatectl --no-ask-password set-timezone ${TIMEZONE}
  timedatectl --no-ask-password set-ntp 1
  localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_US.UTF-8"
  ln -s /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
  # Set keymaps
  localectl --no-ask-password set-keymap ${KEYMAP}

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
  if [[ ${INSTALL_TYPE} == "FULL" ]]; then
      echo "[General]" > /etc/sddm.conf
      echo "Numlock=on" >> /etc/sddm.conf
      echo "[Theme]" >> /etc/sddm.conf
      echo "Current=Nordic" >> /etc/sddm.conf
  fi
fi

