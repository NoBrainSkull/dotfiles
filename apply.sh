#!/bin/sh

if ! command -v "stow" &> /dev/null 
then
	echo "[00F][error] - stow is missing. Install it through your distro repositories."
	exit 1
fi

stow -d "/home/$USER/sources/dotfiles" -t "/home/$USER/.config" ".config"

if [ $? == 0 ]
then
	echo "[00F][success] - dotfiles have been sucessfully applied."
else
	echo "[00F][error] - errors occured. Please check console logs."
fi

