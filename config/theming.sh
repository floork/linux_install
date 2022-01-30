#!/bin/bash

#set theme in home
sudo cp -R home/plasma /home/$USER/.local/share/plasma/
sudo cp -R home/candy-icons /home/$USER/.local/share/icons/
sudo cp -R home/config/* /home/$USER/.config

#set theme in usr
sudo cp -R usr/* /usr/share/icons
