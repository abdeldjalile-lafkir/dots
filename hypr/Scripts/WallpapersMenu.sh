#!/bin/bash

# Wallpaper directory
WALLPAPER_DIR="/home/jalil-lafkir/Pictures/walls"
HYPRPAPER_CONF="/home/jalil-lafkir/.config/hypr/hyprpaper.conf"

# Check if directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

SELECTED_WALLPAPER=$(ls "$WALLPAPER_DIR" | wofi --dmenu --prompt "Select wallpaper" )

if [ -n "$SELECTED_WALLPAPER" ]; then

   
    PREV_WALLPAPER=$(hyprctl hyprpaper listloaded)
    hyprctl hyprpaper unload $PREV_WALLPAPER

    WALLPAPER_CURRENT="$WALLPAPER_DIR/$SELECTED_WALLPAPER"

    echo -n > "$HYPRPAPER_CONF" 

    echo "\$CURRENT_BG =$WALLPAPER_CURRENT" >> "$HYPRPAPER_CONF"
    echo "preload = $WALLPAPER_CURRENT" >> "$HYPRPAPER_CONF"
    echo "wallpaper = ,$WALLPAPER_CURRENT" >> "$HYPRPAPER_CONF"
    echo "splash = false" >> "$HYPRPAPER_CONF"
    echo "ipc = true" >> "$HYPRPAPER_CONF"
    
    
    killall hyprpaper 
    hyprpaper &>/dev/null & disown
    
    echo "Wallpaper changed to $WALLPAPER_CURRENT"
else
    echo "No wallpaper selected"
fi
