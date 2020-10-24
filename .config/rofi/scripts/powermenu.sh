#!/bin/bash

rofi_command="rofi -theme themes/powermenu.rasi"

### Options ###
power_off="po"
reboot="rb"
lock="l"
suspend="s"
log_out="lo"
hibernate="hb"
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out\n$hibernate"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        light-locker-command -l
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
    $log_out)
        i3-msg exit
        ;;
    $hibernate)
		systemctl hibernate
		;;
esac

