set -euo pipefail

# 1. Check for Arch updates
echo "==> Checking for system updates..."
if checkupdates &>/dev/null; then
    read -p "Arch updates are available. Would you like to update the system now? (y/N): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        echo "==> Updating system..."
        sudo pacman -Syu
    else
        echo "==> Skipping system update."
    fi
else
    echo "==> System is up to date."
fi

# 2. Check ClamAV status
CLAMAV_INSTALLED=true
if ! command -v clamscan &>/dev/null; then
    CLAMAV_INSTALLED=false
fi

DAEMONS_RUNNING=true
if ! systemctl is-active --quiet clamav-freshclam.service clamav-daemon.service; then
    DAEMONS_RUNNING=false
fi

if [ "$CLAMAV_INSTALLED" = false ] || [ "$DAEMONS_RUNNING" = false ]; then
    read -p "ClamAV is either missing or its daemons are inactive. Install/configure ClamAV? (y/N): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        if [ "$CLAMAV_INSTALLED" = false ]; then
            echo "==> Installing ClamAV..."
            sudo pacman -S --needed clamav
        fi
        echo "==> Activating and starting ClamAV daemon services..."
        sudo systemctl enable --now clamav-freshclam.service clamav-daemon.service
    else
        echo "==> Operation cancelled by user. Exiting."
        exit 0
    fi
else
    echo "==> ClamAV is installed and daemons are actively running."
fi

TARGET_DIR="$HOME/.config/Quickshell/ClamAV-VirusTotal"
REPO_RAW_URL="https://raw.githubusercontent.com/ppkcomputers/Clamav-Pacman/main"

# Define all repository assets that must be securely curled
FILES=(
    "clamav-osd.qml"
    "toggle.sh"
    "pacman.png"
    "pacman1.gif"
    "pacman2.gif"
    "pacman3.png"
    "blinky.png"
    "blue.png"
    "game-over.png"
    "ghost2.png"
    "ghost3.png"
    "ghost4.png"
)

echo "==> Creating configuration environment tree..."
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

echo "==> Pulling workspace source files from remote repository..."
for file in "${FILES[@]}"; do
    echo "  -> Fetching $file..."
    curl -sSL -O "${REPO_RAW_URL}/${file}"
done

echo "==> Configuring execution attributes..."
chmod +x toggle.sh

echo "==> Installation successful!"
echo "Assets deployed to: $TARGET_DIR"
echo "You can now bind your toggle button inside Hyprland using your script wrapper path."
