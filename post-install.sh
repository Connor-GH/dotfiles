#!/bin/bash

# This part assumes you have your basic system with internet, 
# sudo, pulseaudio/pipewire, etc installed.
# Don't forget GPU drivers!

# grub, efibootmgr, e2fsprogs, linux, vim, etc
# if nvidia, `nvidia-drivers'

cpubrand="amd" # amd or intel

#arch

arch=`pacman -S alacritty $cpubrand-ucode curl git dmenu \
	feh ffmpeg firefox gawk htop i3-gaps i3blocks \
	lm_sensors lsb-release networkmanager \
	nfs-utils noto-fonts noto-fonts-emoji \
	pavucontrol pciutils picom screengrab ttf-hack ufw \
	unzip zip wine youtube-dl`
# arch also needs openrazer, which is from the AUR,
# but it's one package, so no need for an AUR helper

#gentoo

gentoo=`emerge --ask alacritty $cpubrand-ucode curl git net-im/discord-bin dmenu \
	feh ffmpeg www-client/firefox gawk gentoolkit htop x11-wm/i3-gaps \
	x11-misc/i3blocks lm-sensors lsb-release minecraft-launcher moc \
	networkmanager nfs-utils noto noto-emoji pavucontrol pciutils \
	screengrab eselect-repository hack ufw unzip zip wine youtube-dl`

# both distros need to compile this from github:
# https://github.com/FreeTubeApp/FreeTube

# gentoo uses an overlay for openrazer:
# `eselect repository enable vifino-overlay`
# `emaint sync -r vifino-overlay`
# `emerge --ask app-misc/openrazer`


# gentoo uses an overlay for steam:
# `eselect repository enable steam-overlay`
# `emaint sync -r steam-overlay`
# echo "*/*::steam-overlay" >> /etc/portage/package.accept_keywords # (file)
# `emerge --ask games-util/steam-launcher` # (or steam-meta if that fails)


# either uncomment out "$arch" or "$gentoo" depending on the system this 
# is being installed on, of course.

##### $arch
##### $gentoo
