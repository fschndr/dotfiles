# Dotfiles

## Stow

These dotfiles are supposed to be linked by GNU stow (a symlink farmmanager)  

- folders are integrated
- packages could be installed all in one by using *

### Usage:

All:

    stow --target ~ --dir packages *


Just one package (e.g. vim):

    stow --target ~ --dir packages vim