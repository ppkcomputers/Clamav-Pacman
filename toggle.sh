***

### Toggle Script (`toggle.sh`)

To make it seamless to toggle the OSD window in and out under Wayland environments, here is the automated shell utility process. Save this file as `toggle.sh` inside your configuration root and ensure you give it executable access rights (`chmod +x toggle.sh`).

```bash
#!/usr/bin/env bash

# File: toggle.sh
# Description: Toggles the Quickshell ClamAV Pacman OSD daemon presence.

CONFIG_DIR="$HOME/.config/Quickshell/ClamAV-VirusTotal"

if pgrep -f "quickshell.*clamav-osd.qml" > /dev/null; then
    # If the process is currently active, kill it cleanly to slide out
    pkill -f "quickshell.*clamav-osd.qml"
else
    # Otherwise, execute it in background space detached from the main tty loop
    quickshell -p "$CONFIG_DIR/clamav-osd.qml" >/dev/null 2>&1 &
fi
