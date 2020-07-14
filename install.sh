#!/bin/bash
# Arch Linux post-install script

bypass() {
	sudo -v
	while true;
	do
	  sudo -n true
	  sleep 45
	  kill -0 "$$" || exit
	done 2>/dev/null &
}

echo "Starting Arch Linux post-install script..."
sleep 3s
	bypass

clear

echo "Importing files from server..."
sleep 3s
	sudo pacman -Sy git rsync
	sudo rm -rvf ~/.*
	git clone https://github.com/beffiom/dotfiles/
	sudo rsync -rav ~/void-post-installer/dotfiles/.* ~/
	sudo rm -rvf ~/.git/
	sudo rm -rvf ~/dotfiles
	mkdir ~/Videos ~/Devices ~/Devices/A:A_Drive ~/Downloads ~/Music

clear

echo "Updating system..."
sleep 3s
	sudo pacman -Su

clear

echo "Installing packages..."
sleep 3s
	sudo pacman -Sy linux linux-firmware linux-headers xorg-server xf86-input-libinput xf86-input-synaptics xf86-video-fbdev xorg-backlight xautolock xclip xorg-xclipboard xorg-xinit xorg-xmodmap xscreensaver xwallpaper libva make gcc base-devel libx11 libxrandr libxft libxinerama pkgconf
	sudo pacman -Sy xf86-video-intel libva-intel-driver
	sudo pacman -Sy alsa-utils pulseaudio alsa-plugins pulseaudio-alsa pulseaudio-bluetooth bluez-utils
	sudo pacman -Sy acpi acpid bash-completion connman curl dash dunst htop libnotify neovim pulsemixer redshift wget wpa_supplicant unclutter hunspell hunspell-en_US mythes mythes-en
	sudo pacman -Sy p7zip libzip unzip unrar
	sudo pacman -Sy python python-pip python-pyperclip
	sudo pacman -Sy fontconfig ttf-font-awesome noto-fonts noto-fonts-cjk noto-fonts-emoji
	sudo pacman -Sy bspwm compton sxhkd
	sudo pacman -Sy qutebrowser
	sudo pacman -Sy ffmpeg imagemagick maim sxiv
	sudo pacman -Sy ffmpegthumbnailer ffmpegthumbs poppler vifm pcmanfm inotify-tools
	sudo pacman -Sy mpv youtube-dl newsboat
	sudo pacman -Sy mpd mpc ncmpcpp
	sudo pacman -Sy zathura zathura-cb zathura-djvu zathura-pdf-mupdf
	sudo pacman -Sy neofetch cmatrix
	sudo pacman -Sy gtk3 papirus-icon-theme capitaine-cursors libreoffice lxappearance
	sudo pacman -Sy libvirt qemu virt-manager ebtables dnsmasq
	# sudo pacman -S minetest retroarch ppsspp lutris pcsx2

	sudo pip install bs4
	sudo pip install urllib5
	sudo pip install ueberzug
	sudo pip install keepmenu
	sudo pip install castero

	sudo pacman -Rns $(pacman -Qtdq)

clear

echo "Configuring system..."
sleep 3s

	sudo systemctl enable connman

	sudo ln -sf /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
	sudo ln -sf /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
	sudo ln -sf /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
	sudo ln -sf /usr/share/fontconfig/conf.avail/50-user.conf /etc/fonts/conf.d/
	sudo ln -sf /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/

	sudo ln -s /bin/dash /bin/sh

	sudo chmod +x ~/.local/bin/*
	sudo chmod +x ~/.config/bspwm/*
	sudo chmod +x ~/.config/sxhkd/*

	xmodmap ~/.config/appearance/Xmodmap

	# Finish
	cd ~/
	sudo resolvconf -u

clear

echo "Adding user to some groups..."
sleep 3s
	sudo usermod -aG input $USER
	sudo usermod -aG audio $USER
	sudo usermod -aG video $USER
	sudo usermod -aG wheel $USER
	sudo usermod -aG libvirt $USER
	sudo usermod -aG kvm $USER

	sudo pacman -Syu
clear

echo "Don't forget to install st, dmenu, and slock with sudo make clean install"
