#!/bin/sh

while read line
do
	case $line in
		shutdown)
			shutdown now
			;;
		restart)
			reboot
			;;
		*)
			echo "nothing prepared for this option"
			;;
	esac
done < "${1:-/dev/stdin}"



