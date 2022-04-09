# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
if [ -f ~/.alias/aliasrc ]; then
. ~/.alias/aliasrc
fi
alias reload='source ~/.bashrc'

# starship theme
eval "$(starship init bash)"
