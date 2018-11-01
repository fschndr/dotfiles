# Dotfiles

## Stow

These dotfiles are supposed to be linked by GNU stow (a symlink farmmanager)  

- folders are integrated
- packages could be installed all in one by using "*/"

### Usage

Clone this repo directly into $HOME

    git clone https://github.com/fschndr/dotfiles.git $HOME/.dotfiles

All:

    stow --target ~  *

Just one package (e.g. vim):

    stow --target ~ vim
