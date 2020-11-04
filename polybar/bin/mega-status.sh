#!/bin/bash

# echo "megacmd is broken again :("
# exit 0

transfers=$(mega-transfers --show-syncs --summary)

ret=""

downloads=$(echo "$transfers" | tail -n 1 | awk '{print $1}')
if [[ "$downloads" -gt 0 ]]; then
    ret=$ret"▼"
fi

uploads=$(echo "$transfers" | tail -n 1 | awk '{print $7}')
if [[ "$uploads" -gt 0 ]]; then
    ret=$ret"▲"
fi

if [[ "$downloads" -eq 0 ]] && [[ "$uploads" -eq 0 ]]; then
    ret=""
fi

echo $ret
