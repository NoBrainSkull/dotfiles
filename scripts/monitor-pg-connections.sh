#! /bin/bash


# Monitor number of open Postgres connections by user and database
# Simon Brooke <simon(at)jasmine(dot)org(dot)uk>, 6th July 2000
# Copyleft - no warranty, use it if you like it.


tmp=/tmp/wpg$$
bak=/tmp/wpg$$.bak


cat /dev/null > $tmp
cat /dev/null > $bak


while [ 1 -eq 1 ];
do 
    ps auxww |\
    awk '$11 ~ "postgres" {printf( "User: %-8s; Database: %-8s\n", $13, $14)}' > $tmp


    cmp -s $tmp $bak


    if [ $? -ne 0 ]		# there's been a change
    then
    	echo ""			# new line
      date;			# report it
      sort $tmp |\
      uniq -c;
    else
	    echo -n "."		# I'm still alive
    fi
    mv $tmp $bak
    sleep 10; 
done