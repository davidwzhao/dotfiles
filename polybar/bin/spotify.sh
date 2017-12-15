#!/bin/bash

m=$(playerctl -p spotify status 2>&1)

ret=""

if [[ $m == *"Connection"* ]] || [[ $m == *"Not available"* ]] ; then
    :
else
    artist=$(playerctl -p spotify metadata artist)
    title=$(playerctl -p spotify metadata title)
    ret="$ret $artist - $title"
fi

if [[ $m == "Paused" ]] ; then
    ret="$ret (paused)"
fi

echo $ret
