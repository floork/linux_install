cd

sudo pacman -S fish pkgfile ttf-dejavu powerline-fonts inetutils

git clone https://github.com/oh-my-fish/oh-my-fish

cd oh-my-fish

bin/install --offline

yay -S fisher

fisher install IlanCosman/tide@v5

omf install https://github.com/jhillyerd/plugin-git

chsh $USER
