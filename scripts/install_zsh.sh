#install zsh
 sudo pacman -S zsh
 chsh -s $(which zsh)

#install zi (zsh package manager)
sh -c "$(curl -fsSL https://git.io/get-zi)" -- -i skip -b v1.0.0

# Will add minimal configuration
sh -c "$(curl -fsSL https://git.io/get-zi)" --

# Non interactive. Just clone or update repository.
sh -c "$(curl -fsSL https://git.io/get-zi)" -- -i skip

# Minimal configuration + annexes.
sh -c "$(curl -fsSL https://git.io/get-zi)" -- -a annex

# Minimal configuration + annexes + zunit.
sh -c "$(curl -fsSL https://git.io/get-zi)" -- -a zunit

# Minimal configuration with loader
sh -c "$(curl -fsSL https://git.io/get-zi)" -- -a loader

# Suggest your .zshrc configuration to:
# https://github.com/z-shell/playground
sh -c "$(curl -fsSL https://git.io/get-zi)" -- -a ???

#switch to zi
zi self-update

#install plugins
zi light zsh-users/zsh-autosuggestions
zi light zsh-users/zsh-syntax-highlighting

#starship theme
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
# ~/.zshrc
eval "$(starship init zsh)"

