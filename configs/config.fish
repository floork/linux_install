
# My fish config. Not much to see here; just some pretty standard stuff.

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

fm6000

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type
set EDITOR "vim"                                  # $EDITOR use vim in terminal

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

# Function for git push
function gitpush # This is the function name and command we call
 	git --git-dir=$PWD/.git add . # Stage all unstaged files
	git --git-dir=$PWD/.git commit -a -m $argv # Commit files with the given argument as the commit message
	git --git-dir=$PWD/.git pull # Pull to remote
	git --git-dir=$PWD/.git push # Push to remote
end

### END OF FUNCTIONS ###


### ALIASES ###

# vim
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vim='vim'
alias vi='vim'


# Changing "ls" to "exa"
alias ls='exa -s name --icons --time-style=long-iso --group-directories-first'      # my preferred listing
alias ll='exa -ls name --icons --time-style=long-iso --group-directories-first'     # long format
alias la='exa -as name --icons --time-style=long-iso --group-directories-first'     # all files and dirs
alias lal='exa -las name --icons --time-style=long-iso --group-directories-first'   # long format all files and dirs
alias lt='exa -aT --color=always --group-directories-first'                         # tree listing


# help and history
alias h='history'
alias help='man'


# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"


# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


# git
alias gp=gitpush
alias gu=gitupdate
alias gc='git clone'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"
alias lbrynet='/opt/LBRY/resources/static/daemon/lbrynet'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'


# ZSH alias
alias fishrc='vim ~/.config/fish/config.fish' # Quick access to the ~/.fishrc file
alias reload='source ~/.config/fish/config.fish'

# Regular alias
alias please='sudo'
alias cls=clear
alias ende='shutdown now'

# Arch alias
alias packy='yay -S '
alias rpacky='yay -Rdd'
alias pacman-update='sudo pacman-mirrors --geoip'
alias cleanup='sudo pacman -Rns (pacman -Qtdq) && yay -Yc' # Cleanup orphaned packages
alias fixpacman="sudo rm /var/lib/pacman/db.lck"

# Apt alias
alias apacky='sudo apt install'
alias rapacky='sudo apt remove'
alias acleanup='sudo apt-get autoremove'

# Flatpak alias
alias flatty='flatpak install flathub'
alias rflatty='flatpak remove'

alias packdate='yay --noconfirm -Syu && sudo flatpak -y --noninteractive update'
alias apckdate='sudo apt-get -y update && apt-get upgrade && flatpak -y --noninteractive update'


### SETTING THE STARSHIP PROMPT ###
starship init fish | source
