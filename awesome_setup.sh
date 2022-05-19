#!/usr/bin/bash

declare -a dotfiles=("awesome" "term" "zsh" "tmux" "bin" "profiles" "nvim")

#cloning repo
echo "Cloning Repository"
git clone https://github.com/alanphil2k01/dotfiles-awesome.git ~/.dotfiles --recursive
cd ~/.dotfiles

#stowing repo
echo "Stowing the dotfiles"
for dot in "${dotfiles[@]}"
do
    stow $dot
done

#install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# All done
echo "All Done!!"
