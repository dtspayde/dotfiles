---
title:  'README for dotfiles Repository'
author: 'Damon Spayde'
date: 2018-07-17
tags: 
geometry: 'margin=1in'
---

# STOW #

+ Install:  stow --no-fold --verbose=1 
+ Delete:  stow --verbose=1 --D

# GRML #

From <https://grml.org/zsh/> 

+ wget -O .zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
+ wget -O .zshrc.local  https://git.grml.org/f/grml-etc-core/etc/skel/.zshrc

# Software Installation #
+ dnf install \$(cat fedora_packages.txt)
    + dnf repoquery --userinstalled
+ mkdir ~/.local/bin
+ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    + tmux source ~/.tmux.conf
    + Ctrl-a I to install plugins
    + Ctrl-a u to update plugins
+ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
+ python3 -m pip install --user pipx ; python3 -m pipx ensurepath
+ curl -sL "https://yihui.org/tinytex/install-bin-unix.sh" | sh
