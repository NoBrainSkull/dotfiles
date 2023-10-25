export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'
export GREP_OPTIONS='--color=auto'

sh hyprland.sh && echo "goodbye, now logging out" && exit 0 \
 || echo "$? hyperland.sh failed" && tty |grep tty1 \
  && echo "refusing autologin without hyprland on tty1" && exit 0 \
  || echo "not on tt1, letting in"

