#!/bin/bash

rofi_command="rofi -theme themes/scrotmenu.rasi"

### Options ###
screen="scr"
area="ar"
window="win"
# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 1)"
case $chosen in
    $screen)
        sleep 1; scrot
        ;;
    $area)
        scrot -s -e 'mv $f ~/pix/scrot'
        ;;
    $window)
        sleep 1; scrot -u
        ;;
esac

