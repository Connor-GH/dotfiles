# ~/.bashrc
[[ $- != *i* ]] && return # If not running interactively, don't do anything
alias ls='ls -Ah --color=auto --group-directories-first -v'
alias ll='ls -lAh --color=auto --group-directories-first -v'
PS1="\[\033[01;32m\]\u\[\033[0m\]@\[\033[01;35m\]\h\[\033[0m\]:\[\033[01;34m\]\w\[\033[0m\]\$ "

alias sync="sudo emaint --auto sync"
alias upgrade="sudo emerge --ask --quiet --verbose --update --deep --newuse @world" # sudo emerge -aqvuDN world
alias clean="sudo eclean -d distfiles && sudo eclean-kernel -n 2 && sudo emerge --ask --depclean --exclude=gentoo-kernel"
alias vim="nvim"
alias yt="youtube-dl --metadata-from-title '%(artist)s - %(title)s' -ic" #download vid
alias yta="youtube-dl --output '$HOME/Music/%(title)s.%(ext)s' --metadata-from-title '%(artist)s - %(title)s' -xic" #download audio
alias music="mpv $HOME/Music --no-video --shuffle --term-osd-bar --term-osd-bar-chars=[##-]"
alias tos="mpv --no-video --term-osd-bar --term-osd-bar-chars=[##-] --loop-file $HOME/Music/Dave\ Eddy.opus"

alias scrsel='grim -g "$(slurp -d)" - | wl-copy'
# This looks harsh, but it just makes a file like "Distro_YearMonthDay_Hour-Minute.png". Month goes before day.
# You can also make these work in dmenu by putting the command in a file in /usr/bin/scr and /usr/bin/scrsel. Make sure to make them executable.
alias scr="grim $HOME/Pictures/$(date +"%Y-%m-%d-%I%M%p").png"

# git commands
alias g-help="cat ~/.bashrc | sed -sn 21,28p" # subject to change
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

if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

# clean up your home! (~/)
export HISTCONTROL="ignoreboth:erasedups"
export LESSHISTFILE="-"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export HISTFILE="$XDG_STATE_HOME"/bash/history
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

#startx upon login
# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec dbus-run-session sway; fi

# environment variables for things like xdg-open
export EDITOR="nvim"
export TERMINAL="footclient"
export BROWSER="firefox"
export MOZ_ENABLE_WAYLAND=1

# Fetchme binary is still in development.
# It is perhaps not the most secure
# in its current state and use of
# fetchme-bash is recommended at this time
# even though it doesn't get frequent updates.

fetchme
