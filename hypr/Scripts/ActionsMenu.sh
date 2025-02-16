#!/bin/bash

options="Lock\nLogout\nReboot\nShutdown\nCancel"

chosen=$(echo -e "$options" | wofi --dmenu --prompt "Choose an option")

case "$chosen" in
    "Lock")
        hyprlock
        ;;
    "Logout")
        hyprctl dispatch exit
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
    "Cancel")
        exit 0
        ;;
    *)
        echo "No option selected."
        ;;
esac
