# ~/.bashrc
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi #startx upon login
[[ $- != *i* ]] && return # If not running interactively, don't do anything
alias ls='ls -Ah --color=auto --group-directories-first'
alias ll='ls -lAh --color=auto --group-directories-first'
PS1="\u@\[\033[01;32m\]\h\[\033[0m\]:\[\033[01;34m\]\w\[\033[0m\]\$ "
HISTCONTROL=ignoreboth:erasedups
LESSHISTSIZE=-
alias upgrade="sudo pacman -Syu"
alias yt="youtube-dl --add-metadata -ic" #download vid
alias yta="youtube-dl --output '~/Music/%(title)s.%(ext)s' --add-metadata -xic" #download audio
alias music="alacritty -e mocp & cava"
alias gccf="gcc -march=x86-64 -Wall -Wpedantic"
alias mntnas="sudo mount -t nfs 192.168.0.253:/mnt/FirstPool/landon /mnt/NAS"
alias umntnas="sudo umount /mnt/NAS"
fetchme #notes: ssh is disallowed in ufw, and ufw is on at boot.
