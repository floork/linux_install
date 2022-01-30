curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
add-apt-repository -y ppa:teejee2008/ppa
add-apt-repository ppa:aslatter/ppa

#update before install
sudo apt update

#install packages
sudo apt install gh timeshift htop ttf-mscorefonts-installer alacritty gparted kate kitty git

#for ms fonts
sudo fc-cache -vr
