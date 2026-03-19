#!/bin/bash

SCRIPT_NAME="dnfupdate.sh"
INSTALL_DIR="$HOME/.local/bin"
DESKTOP_DIR="$HOME/.local/share/applications"
DESKTOP_FILE="$DESKTOP_DIR/dnfupdate.desktop"
DESKTOP_FILE_ICON="dnfupdateicon.png"

mkdir -p "$INSTALL_DIR"
mkdir -p "$DESKTOP_DIR"
mkdir -p "$HOME/.local/share/icons/"

cp "$SCRIPT_NAME" "$INSTALL_DIR/dnfupdate.sh"
cp "$DESKTOP_FILE_ICON" "$HOME/.local/share/icons/"
chmod +x "$INSTALL_DIR/dnfupdate.sh"

if command -v ptyxis &> /dev/null; then
    TERMINAL="ptyxis --"
elif command -v konsole &> /dev/null; then
    TERMINAL="konsole -e"
elif command -v xfce4-terminal &> /dev/null; then
    TERMINAL="xfce4-terminal -e"
else
    echo "No supported terminal found!"
    exit 1
fi

cat > "$DESKTOP_FILE" << EOF
[Desktop Entry]
Name=DNF Update
Comment=Update system packages
Exec=$TERMINAL bash -c "$INSTALL_DIR/dnfupdate.sh; exec bash"
Icon=$HOME/.local/share/icons/dnfupdateicon.png
Terminal=false
Type=Application
Categories=System;
EOF

echo "Done! The script installed to $INSTALL_DIR"
echo "You may need to re-login for the app menu entry to appear."