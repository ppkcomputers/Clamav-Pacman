set -euo pipefail

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
