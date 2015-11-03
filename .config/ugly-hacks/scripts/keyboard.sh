#!/usr/bin/env bash

set -x

DISPLAY=":0"
HOME="/home/buckstabu/"
XAUTHORITY=$HOME"/.Xauthority"

export DISPLAY XAUTHORITY HOME


case $1 in
    "attach")
        while true; do
            apple_id=`xinput -list | grep -i 'apple' | grep -o "id=[0-9]." | grep -o "[0-9]." | head -1`
            if [ ! -z $apple_id ]; then
                echo "attached"
                setxkbmap -v 10 -option "grp:caps_toggle,grp_led:scroll" -layout "us,ru"
                xmodmap -e "keycode 169 = Insert"
                notify-send "Attached"
                exit 0
            fi
        done
        ;;
    "detach")
        echo "detached"
        setxkbmap -v 10 -option "grp:caps_toggle,grp_led:scroll" -layout "us,ru"
        notify-send "Detached"
        ;;
esac
