# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
export ZSH="/home/floork/.oh-my-zsh"

#plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source /home/floork/.oh-my-zsh/oh-my-zsh.sh

# Load aliases and shortcuts if existent.
[ -f "/home/floork/.alias/aliasrc" ] && source "/home/floork/.alias/aliasrc"
alias reload='source ~/.zshrc'

# starship theme
eval "$(starship init zsh)"
