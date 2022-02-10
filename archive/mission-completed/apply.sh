#!/bin/sh

if ! command -v "stow" &> /dev/null 
then
	echo "[00F][error] - stow is missing. Install it through your distro repositories."
	exit 1
fi


mkdir -p "/home/$USER/.config"
mkdir -p "/home/$USER/.wallpapers"
mkdir -p "/home/$USER/.scripts"

stow -d "/home/$USER/sources" -t "/home/$USER" "dotfiles"
spicetify update &> /dev/null

if [ $? == 0 ]
then
	echo "[00F][success] - dotfiles have been sucessfully applied."
else
	echo "[00F][error] - errors occured. Please check console logs."
fi

