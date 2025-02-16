#!/bin/bash

echo "Scanning for Bluetooth devices..."
bluetoothctl scan on &
SCAN_PID=$!
sleep 10  
kill $SCAN_PID

DEVICE_LIST=$(bluetoothctl devices | awk '{print $3 " " $2}')

# Add the option to turn off Bluetooth to the list
DEVICE_LIST=$(echo "$DEVICE_LIST"; echo "Turn Off Bluetooth")

SELECTED_DEVICE=$(echo "$DEVICE_LIST" | wofi --dmenu --prompt "Select Bluetooth device")

if [ -z "$SELECTED_DEVICE" ]; then
    echo "No Bluetooth device selected. Exiting..." | wofi --dmenu --prompt "Error"
    exit 1
fi

# Check if the user selected "Turn Off Bluetooth"
if [[ "$SELECTED_DEVICE" == "Turn Off Bluetooth" ]]; then
    bluetoothctl power off
    echo "Bluetooth is now turned off."
    exit 0
fi

DEVICE_MAC=$(echo "$SELECTED_DEVICE" | awk '{print $2}')

bluetoothctl pair "$DEVICE_MAC"
bluetoothctl connect "$DEVICE_MAC"

if [ $? -eq 0 ]; then
    RESULT="Successfully connected to $SELECTED_DEVICE"
else
    RESULT="Failed to connect to $SELECTED_DEVICE. Please try again."
fi

echo "$RESULT" | wofi --dmenu --prompt "Connection Status"
