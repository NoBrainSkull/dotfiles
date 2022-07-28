#!/usr/bin/env bash

# Fetch day of week
day_of_week () {
    case $(date +%w) in
        0)
            echo "Sunday"
            ;;
        1)
            echo "Monday"
            ;;
        2)
            echo "Tuesday"
            ;;
        3)
            echo "Wednesday"
            ;;
        4)
            echo "Thursday"
            ;;
        5)
            echo "Friday"
            ;;
        6)
            echo "Saturday"
            ;;
        *)
            echo "oups, $(date "+w")"
    esac
}

# Fetch time as a json struct
current_time () {
    date +'{"hour":"%H","min":"%M","sec":"%S","pretty":"%a, %e %b","day":"%A","month":"%B","dom":"%e","year":"%Y","timestamp":"%Y%m%d%H%M"}'
}

# Quote of the day
today_quote () {
    case $(date +%w) in
        0)
            echo "Neverending weekend. Kick off anything !"
            ;;
        1)
            echo "Don't rush, it's plan day."
            ;;
        2)
            echo "What about goung outside to drink some coffee ?"
            ;;
        3)
            echo "A good day to put things to production."
            ;;
        4)
            echo "Communication day. Do talk to customers."
            ;;
        5)
            echo "No release before the weekend !"
            ;;
        6)
            echo "Yay, it's the weekend ! Work on a custom project of yours."
            ;;
        *)
            echo "oups, $(date +%w)"
            ;;
    esac
}

# Script api
case $1 in
    current_time) 
        current_time
        ;;
    day_of_week) 
        day_of_week
        ;;
    today_quote)
        today_quote
        ;;
    *)
        echo "You didn't register this command"
        ;;
esac
