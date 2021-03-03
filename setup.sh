#!/bin/sh

# Copying configs
clear
if [ ! -d "~/.config"]; then
    mkdir -p ~/.config
fi
echo "Copyting configs to ~/.config directory"
cp -r awesome lf mpv mpd newsboat kitty alacritty terminator nvim flameshot zathura zsh aliasrc shortcutrc zshnameddirrc gtk-2.0 gtk-3.0 $HOME/.config/

# Copying scripts
clear
if [ ! -d "~/.local"]; then
    mkdir -p ~/.local
fi
if [ ! -d "~/.local/bin"]; then
    mkdir -p ~/.local/bin
fi
echo "Copying scripts to ~/.local/bin directory"
cp  -r bin/* $HOME/.local/bin

# Copying Fonts
clear
if [ ! -d "~/.local/share" ]; then
    mkdir -p ~/.local/share
fi
if [ ! -d "~/.local/share/fonts" ]; then
    mkdir -p ~/.local/share/fonts
fi
echo "Copying fonts to ~/.local/share/fonts directory"
cp -r fonts/* $HOME/.local/share/fonts

# Copying proflies
clear
echo "Copying .xinitrc and .profile to $HOME directory"
cp .xinitrc .zprofile $HOME
ln -s $HOME/.zprofile $HOME/.profile

# All done
clear
echo "All Done!!"
