# Linux install

Welcome to my Linux installation this script is divided into 2 Parts.

# Installation:
## 1) Get all the dependencies
### Arch-Based
```
sudo pacman -Syu
sudo pacman -S --noconfirm  --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```
### Debian-Based
```
Not supported yet
```
## 2) Clone the Repo
### Arch-Based Installs
```
git clone https://github.com/floork/linux_install.git
```
### Debian-Based Installs
```
Not supported yet
```
## 3) Run it
```
cd linux_install
./install.sh
```