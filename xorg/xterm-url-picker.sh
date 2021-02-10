#!/usr/bin/env bash

# Cut off the w3c header urls with sed
# xdg-open $(sed 1,5d ~/xterm.*.xhtml | grep -hoE '(http|https)://[a-zA-Z0-9./?=_%:-]*' | rofi -dmenu)
xdg-open $(sed 1,5d ~/xterm.*.xhtml | grep -hoE '(http|https)://[a-zA-Z0-9./?=_%:-]*' | sort -u | rofi -dmenu)
rm ~/xterm.*.xhtml
