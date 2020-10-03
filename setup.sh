#!/bin/sh

# Copying configs
clear
echo "Copyting configs to ~/.config directory"
cp -r awesome lf mpv newsboat alacritty terminator zathura zsh aliasrc shortcutrc zshnameddirrc $HOME/.config/

# Copying scripts
clear
echo "Copying scripts to ~/.local/bin directory"
cp  -r bin/* $HOME/.local/bin

# Copying proflies
clear
echo "Copying .xinitrc and .profile to $HOME directory"
cp .xinitrc .zprofile $HOME
ln -s $HOME/.zprofile $HOME/.profile
