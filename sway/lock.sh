#!/bin/zsh
trap cleanup 0 1 2 3 6

source_image="$1"
modified_image="/tmp/swaylock-$$.jpg"
message="$(whoami)@$(hostname) is locked. Type in your password to continue."
width=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .current_mode.width')

convert -background '#00000080' -fill white \
	-gravity center -size ${width}x25 \
	-font /usr/share/fonts/TTF/Roboto-Medium.ttf -pointsize 13 label:"${message}" miff:- |\
	composite -gravity south -geometry +0+0 \
        - ${source_image} ${modified_image}   

swaylock -s fill -i ${modified_image}

function cleanup {
	rm ${modified_image}
}
