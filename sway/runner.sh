#!/bin/zsh

# $1 - process name, $2 - application path
function run {
    if ! pgrep -x "$1" > /dev/null
    then
        eval "$2 &"
    fi
}

run "dunst" "/usr/bin/dunst"
run "xfce-polkit" "/usr/lib/xfce-polkit/xfce-polkit"