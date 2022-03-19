
#!/usr/bin/env bash
# This script will ask users about their prefrences 
# like disk, file system, timezone, keyboard layout,
# user name, password, etc.

## set up a config file
#touch $CONFIGS_DIR/setup.conf
#CONFIG_FILE=$CONFIGS_DIR/setup.conf
#
#
## set options in setup.conf
#set_option() {
#    if grep -Eq "^${1}.*" $CONFIG_FILE; then # check if option exists
#        sed -i -e "/^${1}.*/d" $CONFIG_FILE # delete option if exists
#    fi
#    echo "${1}=${2}" >>$CONFIG_FILE # add option
#}
# Renders a text based list of options that can be selected by the
# user using up, down and enter keys and returns the chosen option.
#
#   Arguments   : list of options, maximum of 256
#                 "opt1" "opt2" ...
#   Return value: selected index (0 for opt1, 1 for opt2 ...)




fully () {
    echo -ne "Do you want to install the whole script, or just to programms: "
    options=(FULL ONLY_PROGRAMMS)
    select_option $? 4 "${options[@]}"
    full_install=${options[$?]}
    #set_option FULL_INSTALL $full_install
}

installtype () {
  echo -ne "Please select type of installation:\n\n
  Full install: Installs full featured desktop enviroment, with added apps and themes needed for everyday use\n
  Minimal Install: Installs only apps few selected apps to get you started\n"
  options=(FULL MINIMAL)
  select_option $? 4 "${options[@]}"
  install_type=${options[$?]}
  #set_option INSTALL_TYPE $install_type
}

timezone () {
# Added this from arch wiki https://wiki.archlinux.org/title/System_time
time_zone="$(curl --fail https://ipapi.co/timezone)"
echo -ne "
System detected your timezone to be '$time_zone' \n"
echo -ne "Is this correct?
" 
options=("Yes" "No")
select_option $? 1 "${options[@]}"

case ${options[$?]} in
    y|Y|yes|Yes|YES)
    echo "${time_zone} set as timezone"
    #set_option TIMEZONE $time_zone;;
    n|N|no|NO|No)
    echo "Please enter your desired timezone e.g. Europe/London :" 
    read new_timezone
    echo "${new_timezone} set as timezone"
    #set_option TIMEZONE $new_timezone;;
    *) echo "Wrong option. Try again";timezone;;
esac
}
keymap () {
echo -ne "
Please select key board layout from this list"
# These are default key maps as presented in official arch repo archinstall
options=(us by ca cf cz de dk es et fa fi fr gr hu il it lt lv mk nl no pl ro ru sg ua uk)

select_option $? 4 "${options[@]}"
keymap=${options[$?]}

echo -ne "Your key boards layout: ${keymap} \n"
#set_option KEYMAP $keymap
}

clear
logo
fully
installtype
timezone
keymap
clear