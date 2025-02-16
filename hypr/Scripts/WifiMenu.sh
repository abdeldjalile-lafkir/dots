#!/bin/bash

echo "Scanning for Wi-Fi networks..."
nmcli dev wifi rescan
WIFI_LIST=$(nmcli --fields "SSID" dev wifi list | sed -n '1!p')

SELECTED_SSID=$(echo "$WIFI_LIST" | wofi --dmenu --prompt "Select Wi-Fi network")

if [ -z "$SELECTED_SSID" ]; then
    echo "No Wi-Fi network selected. Exiting..." | wofi --dmenu --prompt "Error"
    exit 1
fi

PASSWORD=$(echo -e "Enter password for $SELECTED_SSID" | wofi --dmenu --prompt "Enter password for $SELECTED_SSID" --password)

nmcli dev wifi connect "$SELECTED_SSID" password "$PASSWORD"

if [ $? -eq 0 ]; then
    RESULT="Successfully connected to $SELECTED_SSID"
else
    RESULT="Failed to connect to $SELECTED_SSID. Please check your password and try again."
fi

echo "$RESULT" | wofi --dmenu --prompt "Connection Status"