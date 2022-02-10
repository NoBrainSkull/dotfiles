#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "This help note is shown because you haven't pass any arg."
    echo "Themes are located in /usr/share/spicetify-cli/Themes"
    echo "Choose one Theme name in"
    ls /usr/share/spicetify-cli/Themes

  else
    echo "Change ~/.config/spicetify/config.ini with one theme name. You can
    change colors in colors.ini and user.css"
fi