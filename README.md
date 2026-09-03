# DNF&Arch Update Script

A simple interactive bash script for updating Fedora/Opensuse/Arch-based distros. Flatpak is included. Inspired by Cachy OS built in update tool. 

## Features
- Standard update via `dnf update`/ `paru/yay` 
- Offline update via `dnf offline-upgrade`
- Flatpak update included in both modes
- Autocleans unused dependencies and cache.
## Requirements
- dnf package manager OR AUR-helper
- Gnome Terminal, Konsole or XFCE Terminal
- Flatpak

## Important note!
Terminal apps are required only for installation script. If you don't have DE, you can still use it but without installation script (install manually or just put where it is suitable for you). 

## Installation
1. Clone the repository:
   ```
   git clone https://github.com/Urf1st/dnf_update_script
   cd dnf_update_script
   ```
2. Run the installer:
   ```
   bash install-update.sh
   ```

3. Ready to use!

## Usage
Launch "DNF Update" from your application menu, or run manually:
   ~/.local/bin/dnfupdate.sh OR ~/.local/bin/pacman-update.sh

## License
Unlicense
