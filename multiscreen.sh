#!/bin/sh

number=$(xrandr --listmonitors | head -n '1' | grep -oE '[^ ]+$')
echo "$number"

if [ "$number" -ne 2 ]
then
    echo "we detected $number monitors instead of 2"
    exit 1
fi

mod="Super_L"

xdotool key $mod+2
xdotool key $mod+3
xdotool key $mod+1
xdotool key $mod+2
xdotool key $mod+3
xdotool key $mod+1
