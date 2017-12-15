#!/bin/bash

m=$(dropbox-cli status | head -c 1)

ret=""

if [[ $m == "U" ]] ; then
    ret=""
else
    ret=""
fi

echo $ret
