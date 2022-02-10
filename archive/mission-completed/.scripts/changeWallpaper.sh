if [ ${1: -4} == ".jpg" ]
then
	cp -f $1 ~/.config/awesome/themes/powerarrow/wall.jpg
	echo "Done. Reload Awesome with Super + Ctrl + r"
else
	echo "Bad input"
fi
