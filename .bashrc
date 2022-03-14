# ~/.bashrc
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi #startx upon login
[[ $- != *i* ]] && return # If not running interactively, don't do anything
alias ls='ls -ah --color=auto --group-directories-first'
alias ll='ls -lah --color=auto --group-directories-first'
PS1="\u@\e[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ " #private username: PS1='[user@\h \W]\$ '
HISTCONTROL=ignoreboth
alias upgrade="sudo pacman -Syu"
alias yt="youtube-dl --add-metadata -ic" #download vid
alias yta="youtube-dl --output '~/Music/%(title)s.%(ext)s' --add-metadata -xic" #download audio
alias music="alacritty --hold -e mocp --theme nightly_theme & cava"
alias gccf="gcc -march=x86-64 -Wall -Wpedantic"
alias mntnas="sudo mount -t nfs $IP_OF_NAS:$POOL_LOCATION /mnt/NAS"
alias umntnas="sudo umount /mnt/NAS"
fetchme
