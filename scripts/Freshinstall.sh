#!/bin/bash

echo "Enabling superuser commands..."
sudo echo "done."

GIT_USER=RaisonBlue

# ZSH Installation
sudo pacman -S yay --noconfirm
yay -Syu zsh git kitty firefox gedit --noconfirm
sudo chsh -s /bin/zsh
sudo chsh -s /bin/zsh $USER
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/i3/config" > ~/.i3/config
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/.profile" > ~/.profile
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zprofile" > ~/.zprofile
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zaliases" > ~/.zaliases
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/zsh/.zshrc" >> ~/.zshrc

--logout and reconnect 

sudo pacman -S otf-fira-code --noconfirm
mkdir ~/.config/fontconfig
curl -fsSL "https://raw.githubusercontent.com/$GIT_USER/dotfiles/master/font.conf" > ~/.config/fontconfig/fonts.conf
