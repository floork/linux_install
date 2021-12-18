#install bspwm
sudo pacman -S bspwm

#configure
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
wget -O ~/.config/bspwm/bspwmrc https://raw.githubusercontent.com/ChrisTitusTech/BSPWM-on-KDE/main/bspwmrc
wget -O ~/.config/sxhkd/sxhkdrc https://raw.githubusercontent.com/ChrisTitusTech/BSPWM-on-KDE/main/sxhkdrc
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/sxhkd/sxhkdrc
sudo wget -O /usr/share/xsessions/plasma-bspwm.desktop https://raw.githubusercontent.com/ChrisTitusTech/BSPWM-on-KDE/main/plasma-bspwm.desktop
