#!/bin/sh

if [ -z "$(which stow |grep 'not found')" ]
then
	stow -d "/home/$USER/sources/dotfiles" -t "/home/$USER/.config" ".config"
	echo "[00F][success] - dotfiles have been sucessfully applied."
else
	echo "[00F][error] - stow is missing. Install it through your distro repositories."
fi

