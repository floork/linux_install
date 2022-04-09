# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
export ZSH="/home/$USER/.oh-my-zsh"

#plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source /home/$USER/.oh-my-zsh/oh-my-zsh.sh

# Load aliases and shortcuts if existent.
[ -f "/home/$USER/.alias/aliasrc" ] && source "/home/$USER/.alias/aliasrc"
alias reload='source ~/.zshrc'

# starship theme
eval "$(starship init zsh)"
