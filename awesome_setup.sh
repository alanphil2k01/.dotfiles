#!/bin/sh

dotfiles={"awesome" "zsh" "tmux" "bin" "profiles"}
#cloning repo
echo "Cloning Repository"
git clone https://github.com/alanphil2k01/dotfiles-awesome.git ~/.dotfiles > /dev/null
cd ~/.dotfiles

#stowing repo
echo "Stowing the dotfiles"
for dot in "${dotfiles[@]}"; do
	stow $dot
done

# All done
echo "All Done!!"
