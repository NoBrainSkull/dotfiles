# Dotfiles

1. install package-list
```sh
paru install -S $(cat ./package-list)
```

2. stow what you need
```sh
stow bspwm
stow neofetch
stow rofi
# ...
```

3. add new stow

For instance, adding eww as a stow :
```bash
mkdir eww/.config -p # creating structure to deploy in home
mv ~/.config/eww ./eww/.config # dumping existing into dotfiles
stow eww # effectively symlinking
```

## TODO
* Fresh Install script
* Expanso on-the-fly configurator
* Update rice
