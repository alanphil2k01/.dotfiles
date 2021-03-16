# Enable colors and change prompt:
autoload -U colors && colors	# Load colors

# Templates
PS1_TEMPLATE="%B%{$fg[cyan]%}%~
%{$fg[yellow]%}%{$reset_color%} %b"
RPS1_TEMPLATE="%(?.%{$fg[green]%}.%{$fg[red]%}✗%{$fg[yellow]%}%?) %{$fg[white]%}%D{%L:%M:%S %p}"
PS1_TTY_TEMPLATE="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[cyan]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Execute after enter is pressed in a command
function preexec() {
    timer=$(($(date +%s%3N)))
}

# Resets prompt every second
TMOUT=1
TRAPALRM() {
    zle reset-prompt
}

# Variable to check if it's the first line in the terminal
first=true

# Executes before each prompt
function precmd() {
    case $TERM in
    xterm*|konsole*|alacritty*)
        if [[ $first == true ]];then
            first=false
        else
            echo
        fi
        PS1="$PS1_TEMPLATE"
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
        PS1="$PS1_TTY_TEMPLATE";;
    esac
}

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc"

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

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
