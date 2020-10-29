#!/bin/sh

HOME="/home/$1"

cd $HOME

if [[ $# -eq 0 ]]; then
    echo "Usage ./awesome_setup.sh <your username>"
    exit
fi

#cloning repo
clear
echo "Cloning Repository"
git clone https://github.com/alanphil2k01/dotfiles-awesome.git
cd dotfiles-awesome

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

# Removing repo folder
clear
echo "Removing repository directory"
cd ..
rm -rf dotfiles-awesome
clear
