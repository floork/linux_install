# Linux install

Welcome to my Linux installation this script.

I hope you enjoy it!

# Installation:
## 1) Get all the dependencies
### Arch-Based
```
sudo pacman -Syu
sudo pacman -S --noconfirm --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```
### Debian-Based
```
Not supported yet
```
### Fedora
```
sudo dnf upgrade
sudo dnf -y install git
```
## 2) Clone the Repo
```
git clone https://github.com/floork/linux_install.git
```
## 3) Run it
```
cd linux_install
./install.sh
```
