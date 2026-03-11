#!/usr/bin/env sh

set -eu

################################################################################
# Setup config files
################################################################################
mkdir -p ~/.config
ln -srf xdg_config/nvim ~/.config
ln -srf xdg_config/zsh ~/.config

if [ -e ~/.zshenv ]; then
    mv ~/.zshenv ~/.zshenv.old
fi

ln -srf .zshenv ~/
ln -srf xdg_config/tmux ~/.config

################################################################################
# Install binaries
################################################################################
mkdir -p ~/.local/bin

if ! command -v nvim > /dev/null; then
    curl -o /tmp/nvim -L https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage
    chmod a+x /tmp/nvim
    mv /tmp/nvim ~/.local/bin
fi

################################################################################
# Setup scripts
################################################################################
ln -srf scripts ~/.local
