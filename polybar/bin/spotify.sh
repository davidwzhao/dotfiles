#!/bin/bash

m=$(playerctl -p spotify status 2>&1)

ret=""

if [[ $m == *"Connection"* ]] || [[ $m == *"Not available"* ]] || [[ $m == *"No players found"* ]]; then
    :
else
    artist=$(playerctl -p spotify metadata artist)
    title=$(playerctl -p spotify metadata title)
    ret="$ret󰎇 $artist - $title"
fi

if [[ $m == "Paused" ]] ; then
    ret="$ret (paused)"
fi

ret="$(echo $ret | tr '&' '\\&' )"

echo $ret
