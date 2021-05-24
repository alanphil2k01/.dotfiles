#!/bin/sh

# Copying configs
mkdir -p ~/.config
echo "Copyting configs to ~/.config directory"
cp -r awesome lf mpv mpd newsboat kitty alacritty terminator flameshot feh zathura zsh tmux aliasrc shortcutrc zshnameddirrc $HOME/.config/ > /dev/null

# Copying scripts
mkdir -p ~/.local/bin
echo "Copying scripts to ~/.local/bin directory"
cp  -r bin/* $HOME/.local/bin

# Copying Fonts
mkdir -p ~/.local/share/fonts
echo "Copying fonts to ~/.local/share/fonts directory"
cp -r fonts/* $HOME/.local/share/fonts > /dev/null

# Copying proflies
echo "Copying .xinitrc and .profile to $HOME directory"
cp .xinitrc .zprofile $HOME > /dev/null
ln -s $HOME/.zprofile $HOME/.profile > /dev/null

# Creating history file for zsh
echo "Creating history file for zsh"
mkdir -p $HOME/.cache/zsh
touch $HOME/.cache/zsh/history

# nvim configs
echo "Running neovim setup script"
curl -O https://raw.githubusercontent.com/alanphil2k01/vim-config/master/setup-nvim.sh 
sh setup-nvim.sh

# All done
echo "All Done!!"
