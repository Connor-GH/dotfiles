#!/bin/bash

# This part assumes you have your basic system with internet, 
# sudo/doas, pulseaudio/pipewire, etc installed.
# Don't forget GPU drivers!

# grub, efibootmgr, e2fsprogs, linux, [n]vim, X, etc
# if nvidia, `nvidia-drivers' on gentoo, or `nvidia' on arch.

# this script assumes that you are not root. 
# (you should have sudo/doas access ready)

root_helper=sudo

WM=$BSPWM

BSPWM="polybar sxhkd bspwm"
I3="i3-gaps i3blocks"

cpubrand=amd # amd or intel

DOTFILES=https://github.com/Connor-GH/Huayras-dotfiles

GREEN='\033[1;32m'
NONE='\033[0m'


echo "Cloning Dotfiles directory..."
git clone $DOTFILES

# git cloned directories normally start with the user's repo name, so we go into that
printf "Entering Dotfiles Directory... "
cd $(echo $DOTFILES | tr "/" "\n" | tail -1)
echo -en "$GREEN Done $NONE\n"

# mv commands tend to be less taxing than a cp -r + rm -rf

mkdir $HOME/.config
# the .config directory may have more files than you want. 
# it contains files for both bspwm and i3. bspwm is the
# only one still updated, but the i3 config is solid.

echo -en "Moving config files... "
mv  .config/*       $HOME/.config
mkdir $HOME/scripts
mv scripts/* $HOME/scripts

echo -en "$GREEN Done $NONE\n"

make_statusbar_startup() {
echo -en "Compiling statusbar and startup script (this will produce a lot of output)...\n"
cd scripts/C
make statusbar startup-script
cd -
echo -en "$GREEN Done $NONE\n"
}


echo -en "Moving Bash-related files... "
mv  .bash_profile   $HOME
mv  .bashrc         $HOME

echo -en "$GREEN Done $NONE\n"


echo -en "Moving X-related files... "
mv  .Xresources     $HOME
mv  .xinitrc        $HOME

echo -en "$GREEN Done $NONE\n"


#arch

arch() {
$root_helper pacman -S alacritty $cpubrand-ucode curl dmenu \
	feh ffmpeg firefox gawk htop \
	lm_sensors lsb-release maim mpv networkmanager \
	nfs-utils noto-fonts noto-fonts-emoji \
	pavucontrol pciutils picom ttf-hack terminus-font ufw \
	unzip wine $WM xorg-xinit xorg-server xorg-xrandr youtube-dl zip
}

# arch also needs openrazer, which is from the AUR (official).
# just run:
# git clone https://aur.archlinux.org/openrazer-meta.git && cd openrazer-meta && makepkg -si

#gentoo

gentoo() {
echo "You should add your make.conf first. Let's do that."
# your makeopts and common flags were probably already done 
# during the bootstrapping process

# it's good practice to put your use flags in make.conf,
# just so you know what they are. 
$root_helper emerge --info | grep ^USE > /etc/portage/make.conf

# note - hack font is only used in the statusbar for both window managers

$root_helper emerge --newuse --ask alacritty $cpubrand-ucode net-misc/curl \
    dmenu eclean-kernel eselect eselect-repository \
	feh ffmpeg www-client/firefox gawk gentoolkit hack htop \
	lm-sensors lsb-release maim mpv networkmanager \
    nfs-utils noto noto-emoji pavucontrol pciutils picom \
    terminus-font ufw unzip wine $WM x11-apps/xinit x11-base/xorg-drivers \
    x11-base/xorg-server x11-base/xorg-x11 youtube-dl zip
}

# both distros need to compile this from github (automatic script soon):
# https://github.com/FreeTubeApp/FreeTube

# gentoo uses an overlay for openrazer:
openrazer() {
$root_helper eselect repository enable vifino-overlay
$root_helper emaint sync -r vifino-overlay
$root_helper emerge --ask app-misc/openrazer
}


# gentoo uses an overlay for steam:
steam() {
$root_helper eselect repository enable steam-overlay
$root_helper emaint sync -r steam-overlay

# using su like this is probably advised against
# but the only alternative is logging a pty in as root
su -c "echo '*/*::steam-overlay' >> /etc/portage/package.accept_keywords" root
$root_helper emerge --ask games-util/steam-launcher # (or steam-meta if that fails)
}

# uncomment this line only if you are using my dotfiles.
##### make_statusbar_startup

# either uncomment out "arch" or "gentoo" depending on the system this 
# is being installed on, of course.

##### arch
##### gentoo; openrazer; steam
