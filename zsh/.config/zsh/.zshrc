# Enable colors and change prompt:
autoload -U colors && colors	# Load colors

# Templates
PS1_TEMPLATE_LINE_1="%B%{$fg[red]%}%m: %{$fg[cyan]%}%~%{$fg[green]%}"
PS1_TEMPLATE_LINE_2="%{$fg[yellow]%}%{$reset_color%} %b"
RPS1_TEMPLATE="%(?.%{$fg[green]%}.%{$fg[red]%}✗%{$fg[yellow]%}%?) %{$fg[white]%}%D{%L:%M %p}"
PS1_TTY_TEMPLATE="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[cyan]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

# Execute after enter is pressed in a command
function preexec() {
    timer=$(($(date +%s%3N)))
}

# Resets prompt every 60 seconds
TMOUT=60
TRAPALRM() {
    zle reset-prompt
}

# Variable to check if it's the first line in the terminal
first=true

# Executes before each prompt
function precmd() {
    case $TERM in
    xterm*|konsole*|alacritty*|screen*)
        if [[ $first == true ]];then
            first=false
        else
            echo
        fi
        PS1="$PS1_TEMPLATE_LINE_1 $(vcs_info_wrapper)
$PS1_TEMPLATE_LINE_2"
        RPS1="$RPS1_TEMPLATE"
        if [ $timer ]; then
            now=$(($(date +%s%3N)))
            elapsed=$(($now-$timer))
            time_taken="${elapsed}ms"
            if (($elapsed > 1000)); then
                elapsed=$(($elapsed/1000))
                time_taken="${elapsed%%1##}s"
            fi
            RPS1="$RPS1_TEMPLATE %{$fg[cyan]%}$time_taken%{$reset_color%}"
            unset timer
        else
            RPS1="$RPS1_TEMPLATE"
        fi ;;
    *)
        PS1="$PS1_TTY_TEMPLATE"
        RPS1="$RPS1_TEMPLATE"
        RPS1="%{$fg[white]%}%D{%L:%M %p} $(vcs_info_wrapper)"
        ;;
    esac
}

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
 if [[ ${KEYMAP} == vicmd ]]; then
   echo -ne '\e[2 q'
 elif [[ ${KEYMAP} == main ]] ||
      [[ ${KEYMAP} == viins ]]; then
   echo -ne '\e[6 q'
 fi
}
function zle-line-init() {
  zle -K viins
}
zle -N zle-line-init
zle -N zle-keymap-select

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load syntax highlighting; should be last.
[ -f "/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" ] && source "/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Commmmand aliases
# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"
alias cp="cp -iv"  \
    mv="mv -iv"  \
    rm="rm -vI"  \
    mkd="mkdir -pv"  \
    ls="ls -hN --color=auto --group-directories-first"  \
    ll="ls -la -hN --color=auto --group-directories-first"  \
    grep="grep --color=auto"  \
    feh="feh -B black"  \
    ka="killall"  \
    e="$EDITOR"  \
    v="$EDITOR"  \
    p="sudo pacman"  \
    z="zathura"  \
    diff="diff --color=auto"  \
    g="git"  \
    asdf="setxkbmap us dvorak -option caps:escape"  \
    aoeu="setxkbmap us -option caps:escape"  \

# Dir aliases
alias cac="cd ${XDG_CACHE_HOME:-$HOME/.cache}"  \
    cf="cd ${XDG_CONFIG_HOME:-$HOME/.config}"  \
    D="cd ${XDG_DOWNLOAD_DIR:-$HOME/Downloads}"  \
    d="cd ${XDG_DOCUMENTS_DIR:-$HOME/Documents}"  \
    dt="cd ${XDG_DATA_HOME:-$HOME/.local/share}"  \
    h="cd $HOME"  \
    m="cd ${XDG_MUSIC_DIR:-$HOME/Music}"  \
    mn="cd /mnt"  \
    pp="cd ${XDG_PICTURES_DIR:-$HOME/Pictures}"  \
    scr="cd ${XDG_PICTURES_DIR:-$HOME/Pictures}/Screenshots"  \
    sc="cd $HOME/.local/bin"  \
    src="cd $HOME/.local/src"  \
    P="cd $HOME/Projects"  \
    vv="cd ${XDG_VIDEOS_DIR:-$HOME/Videos}"  \
    cfz="$EDITOR $ZDOTDIR/.zshrc"  \
    cfv="cd ${XDG_CONFIG_HOME:-$HOME/.config}/nvim && $EDITOR ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.vim"  \
    cfa="cd ${XDG_CONFIG_HOME:-$HOME/.config}/awesome && $EDITOR ${XDG_CONFIG_HOME:-$HOME/.config}/awesome/rc.lua"  \

# Zsh named dirs
hash -d cf=${XDG_CONFIG_HOME:-$HOME/.config}
hash -d D=${XDG_DOWNLOAD_DIR:-$HOME/Downloads}
hash -d d=${XDG_DOCUMENTS_DIR:-$HOME/Documents}
hash -d dt=${XDG_DATA_HOME:-$HOME/.local/share}
hash -d h=$HOME
hash -d mn=/mnt
hash -d pp=${XDG_PICTURES_DIR:-$HOME/Pictures}
hash -d scr=$HOME/Pictures/Screenshots
hash -d sc=$HOME/.local/bin
hash -d src=$HOME/.local/src
hash -d vv=${XDG_VIDEOS_DIR:-$HOME/Videos}
