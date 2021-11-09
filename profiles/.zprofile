#!/bin/zsh

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

[[ -f $HOME/.profile ]] && source $HOME/.profile
[[ -f $ZDOTDIR/.zshrc ]] && source $ZDOTDIR/.zshrc

if [[ "$(tty)" = "/dev/tty1" ]]; then
    exec startx
fi
