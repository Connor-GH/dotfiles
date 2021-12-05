#
# ~/.bashrc
#auto startx upon login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1="\u@\e[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ " #private username
HISTCONTROL=ignoreboth
#Aliases
alias upgrade="sudo pacman -Syu"
alias yt="youtube-dl --add-metadata -ic" #download vid
alias yta="youtube-dl --add-metadata -xic" #download audio
alias music="alacritty --hold -e mocp --theme nightly_theme & cava"
alias email="sylpheed"
