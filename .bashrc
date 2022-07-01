# ~/.bashrc
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi #startx upon login
[[ $- != *i* ]] && return # If not running interactively, don't do anything
alias ls='ls -Ah --color=auto --group-directories-first'
alias ll='ls -lAh --color=auto --group-directories-first'
PS1="\u@\[\033[01;32m\]\h\[\033[0m\]:\[\033[01;34m\]\w\[\033[0m\]\$ "

alias upgrade="sudo pacman -Syu"
# alias upgrade="sudo emaint --auto sync && sudo emerge --ask --verbose --update --deep --newuse @world"
# alias clean="sudo eclean-kernel -n 2 && sudo emerge --ask --depclean --exclude=gentoo-kernel"
alias vim="nvim"
alias scrsel="main --select | xclip -selection clipboard -t image/png"
# This looks harsh, but it just makes a file like "Arch_20220221_10-05.png". Month goes before day.
# You can also make these work in dmenu by putting the command in a file in /usr/bin/scr and /usr/bin/scrsel. Make sure to make them executable.
alias scr="maim ~/Pictures/$(cat /etc/os-release | sed -sn 1p | sed 's/"//g' | sed 's/NAME=//g' | awk '{print $1}')_$(date +"%Y%m%d_%I-%M").png"
alias yt="youtube-dl --metadata-from-title '%(artist)s - %(title)s' -ic" #download vid
alias yta="youtube-dl --output '~/Music/%(title)s.%(ext)s' --metadata-from-title '%(artist)s - %(title)s' -xic" #download audio
alias music="mpv ~/Music --no-video --shuffle --term-osd-bar --term-osd-bar-chars=[##-]"

# set XDG standard directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# clean up your home! (~/)
export HISTCONTROL="ignoreboth:erasedups"
export LESSHISTFILE="-"

# larger screens have a need for specific sizes for GUIs
export GDK_SCALE="1"
export GDK_DPI_SCALE="1"
export QT_AUTO_SCREEN_SET_FACTOR="0"
export QT_SCALE_FACTOR="1"
export QT_FONT_DPI="96"

# environment variables for things like xdg-open
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

# Fetchme binary is still in development.
# It is perhaps not the most secure 
# in its current state and use of 
# fetchme-bash is recommended at this time
# even though it doesn't get frequent updates.

fetchme
