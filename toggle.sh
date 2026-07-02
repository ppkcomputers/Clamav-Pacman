#!/usr/bin/env bash

CONFIG_DIR="$HOME/.config/Quickshell/ClamAV-VirusTotal"

if pgrep -f "quickshell.*clamav-osd.qml" > /dev/null; then
    pkill -f "quickshell.*clamav-osd.qml"
else
    quickshell -p "$CONFIG_DIR/clamav-osd.qml" >/dev/null 2>&1 &
fi
