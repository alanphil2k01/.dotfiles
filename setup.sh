#!/bin/sh

# Copying configs

echo "Copyting configs to ~/.config directory"
cp awesome lf mpv newsboat terminator zathura zsh aliasrc shortcutrc zshnameddirrc $HOME/.config/

# Copying scripts

echo "Copying scripts to ~/.local/bin directory"
cp bin/* $HOME/.local/bin

# Copying proflies

echo "Copying .xinitrc and .profile to $HOME directory"
cp .xinitrc .zprofile $HOME
ln -s $HOME/.zprofile $HOME/.profile
