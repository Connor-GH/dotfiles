# ~/.bashrc
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi #startx upon login
[[ $- != *i* ]] && return # If not running interactively, don't do anything
alias ls='ls -Ah --color=auto --group-directories-first'
alias ll='ls -lAh --color=auto --group-directories-first'
PS1="\u@\[\033[01;32m\]\h\[\033[0m\]:\[\033[01;34m\]\w\[\033[0m\]\$ "

alias upgrade="sudo pacman -Syu"
alias vim="nvim"
alias yt="youtube-dl --add-metadata -ic" #download vid
alias yta="youtube-dl --output '~/Music/%(title)s.%(ext)s' --add-metadata -xic" #download audio
alias mocp="mpv ~/Music --no-video --shuffle --term-osd-bar --term-osd-bar-chars=[##-]"
alias gccf="gcc -march=x86-64 -Wall -Wpedantic"

export HISTCONTROL="ignoreboth:erasedups"
export LESSHISTFILE="-"
export GDK_SCALE="1"
export GDK_DPI_SCALE="1"
export QT_AUTO_SCREEN_SET_FACTOR="0"
export QT_SCALE_FACTOR="1"
export QT_FONT_DPI="96"

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

fetchme #notes: ssh is disallowed in ufw, and ufw is on at boot.
