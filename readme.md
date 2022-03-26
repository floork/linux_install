# Linux install

Welcome to my Linux installation this script is divided into 2 Parts.

## Make shure your system is up to date:
### Arch
```
sudo pacman -Syu
```
and install yay
```
sudo pacman -S --noconfirm  --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```
### Debian / Ubuntu
```
Not supported yet
```

To use it just do:
### at first
```
sudo bash part-1.sh
```

### after
```
./part-2.sh
```