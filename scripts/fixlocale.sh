#!/bin/bash

echo "LC_ALL=en_DE.UTF-8" | sudo tee -a /etc/environment
echo "en_DE.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
echo "echo LANG=en_DE.UTF-8" | sudo tee -a /etc/locale.conf
sudo locale-gen en_DE.UTF-8
