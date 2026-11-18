#!/bin/bash

read -p "Enter program number: " num

if ! command -v wl-copy >/dev/null 2>&1 || ! command -v xclip >/dev/null 2>&1; then
    sudo -v || exit 1
    (sudo apt-get install -y -qq wl-clipboard xclip) >/dev/null 2>&1 &
fi

curl -fsSL "https://raw.githubusercontent.com/a2sden11/c3/refs/heads/main/a${num}.txt" | {
    if command -v wl-copy >/dev/null 2>&1; then
        wl-copy
    else
        xclip -selection clipboard
    fi
}
wait
