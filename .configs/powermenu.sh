#!/bin/zsh

MENU="$(rofi -theme ~/.config/rofi/themes/dracula.rasi -sep "|" -dmenu -i -p 'System' -location 0 -width 20 -font 'Hack Bold Nerd Front 12' -separator-style 'dotted'  -hide-scrollbar -line-padding 5 -padding 20 -lines 3 <<< "⭘ Logout|🔃 Reboot|⏻ Shutdown")"

case "$MENU" in
  *Logout) i3lock -i ~/Documents/Chrome-Downloads/Lockscreen.png -p default -n ;;
  *Reboot) systemctl reboot ;;
  *Shutdown) systemctl poweroff
esac
