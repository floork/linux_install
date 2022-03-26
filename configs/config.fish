## Set values
# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

## Export variable need for qt-theme
if type "qtile" >> /dev/null 2>&1
   set -x QT_QPA_PLATFORMTHEME "qt5ct"
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low


## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end


## Starship prompt
if status --is-interactive
   source ("/usr/bin/starship" init fish --print-full-init | psub)
end

## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Alias
alias ls='exa -s name --icons --time-style=long-iso --group-directories-first'
alias ll='exa -ls name --icons --time-style=long-iso --group-directories-first'
alias la='exa -as name --icons --time-style=long-iso --group-directories-first'
alias lal='exa -las name --icons --time-style=long-iso --group-directories-first'


alias grep='grep --color'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias help='man'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vim='vim'
alias vi='vim'

function gitpush # This is the function name and command we call
 	git --git-dir=$PWD/.git add . # Stage all unstaged files
	git --git-dir=$PWD/.git commit -a -m $argv # Commit files with the given argument as the commit message
	git --git-dir=$PWD/.git pull # Pull to remote
	git --git-dir=$PWD/.git push # Push to remote
end
alias gp=gitpush
alias gu=gitupdate
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
alias packy='yay -S'
alias rpacky='yay -Rdd'
alias pacman-update='sudo pacman-mirrors --geoip'
alias cleanup='sudo pacman -Rns `pacman -Qtdq` && yay -Yc' # Cleanup orphaned packages
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
