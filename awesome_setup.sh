#!/bin/sh

cd $HOME

#cloning repo
echo "Cloning Repository"
git clone https://github.com/alanphil2k01/dotfiles-awesome.git ~/.dotfiles > /dev/null
cd ~/.dotfiles

# Copying configs
mkdir -p ~/.config
echo "Copyting configs to ~/.config directory"
cp -r awesome alacritty kitty zsh tmux $HOME/.config/ > /dev/null

# Copying scripts
mkdir -p ~/.local/bin
echo "Copying scripts to ~/.local/bin directory"
cp  -r bin/* $HOME/.local/bin > /dev/null

# Copying proflies
echo "Copying .xinitrc and .profile to $HOME directory"
cp .xinitrc .zprofile .profile $HOME > /dev/null

# Creating history file for zsh
echo "Creating history file for zsh"
mkdir -p $HOME/.cache/zsh
touch $HOME/.cache/zsh/history

# All done
echo "All Done!!"
