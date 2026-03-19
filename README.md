# DNF Update Script

A simple interactive bash script for updating Fedora packages (DNF + Flatpak). Inspired by Cachy OS built in update tool. 

## Features
- Standard update via `dnf update`
- Offline update via `dnf offline-upgrade`
- Flatpak update included in both modes

## Requirements
- dnf package manager
- Gnome Terminal, Konsole or XFCE Terminal
- Flatpak

## Important note!
Terminal apps are required only for installation script. If you don't have DE, you can still use it but without installation script (install manually or just put where it is suitable for you). 

## Installation
1. Clone the repository:
   ```
   git clone https://github.com/Urf1st/dnf_update_script
   cd dnfupdate
   ```
2. Run the installer:
   ```
   bash installdnfupdate.sh
   ```

3. Ready to use!

## Usage
Launch "DNF Update" from your application menu, or run manually:
   ~/.local/bin/dnfupdate.sh

## License
Unlicense