#!/usr/bin/env bash

xdg-open $(grep -hoE '(http|https)://[a-zA-Z0-9./?=_%:-]*' ~/xterm.*.xhtml | rofi -dmenu)
rm ~/xterm.*.xhtml
