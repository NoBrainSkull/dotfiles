while getopts idrs steps
do
	case $steps in
		i) echo "installing..."
		*) echo "options are :"
			 echo "p: install [p]ackages"
			 echo "r: apply [r]ice"
	esac
done
