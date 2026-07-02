# ClamAV-VirusTotal Pacman OSD Scanner

An interactive, retro arcade-style On-Screen Display (OSD) notification and mitigation tool built for Wayland composers using **Quickshell** (Qt6 / QML). It wraps `clamscan` in a gamified interface that visually tracks down system threats using Pacman animations.

## Features

- 🔍 **Real-time Scanning Execution**: Automates deep-directory scanning over designated paths using native system processes.
- 👾 **Vibrant Retro Animations**: 
  - Displays unique animations depending on scanner states (`idle`, `scanning`, `clean completed`).
  - Implements an interactive multi-stage suspense sequence upon threat discovery: shifts from a standard threat sprite to a vulnerable blue ghost, plays an animated side-scrolling chomping Pacman sequence, triggers a jittery score board layout, and resolves into a retro Game Over splash.
- 🛡️ **Interactive Mitigation Matrix**: Gives you single-click options to inspect files on VirusTotal or physically purge the virus off the drive with visual stage-by-stage ghost vaporization indicators.
- ⌨️ **Keyboard Navigation**: Hit `Space` to instantly initiate a clean environment sweep from your console or layout binding.

---

## Dependencies

Before running the OSD interface shell configuration, ensure you have the following packages installed on your system:

- **quickshell** (A framework for building Wayland shells out of QML expressions)
- **qt6-declarative** & **qt6-5compat**
- **clamav** (with updated signatures via `freshclam`)
- **coreutils** (`rm`)

---

## Installation & Structure

# Hyprland lua keybind
## Custom Pacman Antivirus OSD Scanner Toggle
## Uses Super + Alt + C to gracefully launch or terminate the overlay window layer
bind("SUPER ALT", "C", "exec", "~/.config/Quickshell/ClamAV-VirusTotal/toggle.sh")

Clone the repository inside your local configuration space:

```bash
mkdir -p ~/.config/Quickshell/
cd ~/.config/Quickshell/
git clone [https://github.com/yourusername/ClamAV-VirusTotal.git](https://github.com/yourusername/ClamAV-VirusTotal.git)
cd ClamAV-VirusTotal

