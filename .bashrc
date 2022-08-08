# ~/.bashrc
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi #startx upon login
[[ $- != *i* ]] && return # If not running interactively, don't do anything
alias ls='ls -Ah --color=auto --group-directories-first -v'
alias ll='ls -lAh --color=auto --group-directories-first -v'
PS1="\u@\[\033[01;32m\]\h\[\033[0m\]:\[\033[01;34m\]\w\[\033[0m\]\$ "

alias upgrade="sudo pacman -Syu"
alias clean="sudo pacman -Scc"
# alias upgrade="sudo emaint --auto sync && sudo emerge --ask --verbose --update --deep --newuse @world"
# alias clean="sudo eclean-kernel -n 2 && sudo emerge --ask --depclean --exclude=gentoo-kernel"
alias vim="nvim"
alias yt="youtube-dl --metadata-from-title '%(artist)s - %(title)s' -ic" #download vid
alias yta="youtube-dl --output '~/Music/%(title)s.%(ext)s' --metadata-from-title '%(artist)s - %(title)s' -xic" #download audio
alias music="mpv ~/Music --no-video --shuffle --term-osd-bar --term-osd-bar-chars=[##-]"

# git commands
alias g-help="cat ~/.bashrc | sed -sn 18,23p" # subject to change
alias gadd="git add ."
alias gcommit="git commit -m"
alias gpush="git push"
alias gstatus="git status"
# gh upload <version> <file>
# gh release [create/delete]

# set XDG standard directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# clean up your home! (~/)
export HISTCONTROL="ignoreboth:erasedups"
export LESSHISTFILE="-"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export HISTFILE="$XDG_STATE_HOME"/bash/history
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'

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
