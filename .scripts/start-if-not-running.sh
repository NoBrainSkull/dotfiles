#!/bin/sh
pgrep -x $1 > /dev/null || $($1) &
