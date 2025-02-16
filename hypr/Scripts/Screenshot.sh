#!/bin/bash

options="Area\nActive Window\nMonitor\nCancel"

chosen=$(echo -e "$options" | wofi --dmenu --prompt "Choose a screenshot option")

case "$chosen" in
    "Area")
        grim -g "$(slurp)" - | swappy -f -
        ;;
    "Active Window")
        sleep 0.3
        grim -g "$(hyprctl -j activewindow | jq -r '"\(.at[0]-5),\(.at[1]-5) \(.size[0]+10)x\(.size[1]+10)"')" /tmp/screenshot.png && swappy -f /tmp/screenshot.png
        ;;
    "Monitor")
        sleep 0.3
        grim /tmp/screenshot.png && swappy -f /tmp/screenshot.png
        ;;
    "Cancel")
        exit 0
        ;;
    *)
        echo "No option selected."
        ;;
esac
