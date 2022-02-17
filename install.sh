#!/bin/bash

#get inputs
echo "What is your Distro-Type?"
read -p "Arch_='a', Ubuntu='u' or Debian='d': " distro
echo "What language do you want?"
read -p "English='en' and German='de': " language

#use the right script

#arch en
if [ $distro == "a" ] || [ $distro == "A" ]  && [ $language == "en" ] || [ $language == "EN" ] || [ $language == "e" ]; then
        sh scripts/en_arch.sh
#arch de
elif [ $distro == "a" ] || [ $distro == "A" ]  && [ $language == "de" ] || [ $language == "DE" ] || [ $language == "d" ]; then
        sh scripts/de_arch.sh
#Ubuntu en
elif [ $distro == "u" ] || [ $distro == "U" ]  && [ $language == "en" ] || [ $language == "EN" ] || [ $language == "e" ]; then
        sh scripts/en_ubun.sh
#Ubuntu de
elif [ $distro == "u" ] || [ $distro == "U" ]  && [ $language == "de" ] || [ $language == "DE" ] || [ $language == "d" ]; then
        sh scripts/de_ubun.sh
#Debian en
elif [ $distro == "d" ] || [ $distro == "D" ]  && [ $language == "en" ] || [ $language == "EN" ] || [ $language == "e" ]; then
        sh scripts/en_deb.sh
#Debian de
elif [ $distro == "d" ] || [ $distro == "D" ]  && [ $language == "de" ] || [ $language == "DE" ] || [ $language == "d" ]; then
        sh scripts/de_deb.sh
else
    echo "please check use the right terms!!"
fi

#do theming
cd config/
sh theming.sh
sh cursor.sh