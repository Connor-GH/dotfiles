#!/bin/bash

# This part assumes you have your basic system with internet, 
# sudo, pulseaudio/pipewire, etc installed.
# Don't forget GPU drivers!

# grub, efibootmgr, e2fsprogs, linux, vim, etc
# if nvidia, `nvidia-drivers'

cpubrand="amd" # amd or intel

#archlinux. Will need AUR.

arch=`yay -S alacritty-git $cpubrand-ucode cava curl git discord dmenu \
	feh ffmpeg firefox freetube gawk htop i3-gaps i3blocks \
	lm_sensors lsb-release minecraft-launcher moc networkmanager
	nfs-utils noto-fonts noto-fonts-emoji openrazer-meta pacman-contrib \
	pavucontrol pciutils picom-ibhagwan-git screengrab ttf-hack ufw \
	unzip zip wine youtube-dl`

#gentoo

gentoo=`emerge --ask alacritty $cpubrand-ucode curl git net-im/discord-bin dmenu \
	feh ffmpeg www-client/firefox gawk gentoolkit htop x11-wm/i3-gaps \
	x11-misc/i3blocks lm-sensors lsb-release minecraft-launcher moc \
	networkmanager nfs-utils noto noto-emoji pavucontrol pciutils \
	screengrab eselect-repository hack ufw unzip zip wine youtube-dl`


# gentoo needs cava compiled from github, no default repo
# https://github.com/karlstav/cava

# gentoo needs freetube compiled from github, no default repo
# https://github.com/FreeTubeApp/FreeTube

# gentoo needs picom ibhagwan fork compiled from github, no default repo
# https://github.com/ibhagwan/picom

# gentoo uses an ovelay for openrazer:
# `eselect repository enable vifino-overlay`
# `emaint sync -r vifino-overlay`
# `emerge --ask app-misc/openrazer`


# gentoo uses an ovelay for openrazer:
# `eselect repository enable steam-overlay`
# `emaint sync -r steam-overlay`
# echo "*/*::steam-overlay" >> /etc/portage/package.accept_keywords (file)
# `emerge --ask games-util/steam-launcher` (or steam-meta if that fails)


# either uncomment out "$arch" or "$gentoo" depending on the system this 
# is being installed on, of course.

##### $arch
##### $gentoo
