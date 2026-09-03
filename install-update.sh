#!/bin/bash
read -r -p 'What type of system do you have? Fedora/OpenSuse press "f", Arch-based, press "a":' answer
if [[ "$answer" == "f" ]]; then
    SCRIPT_NAME="dnfupdate.sh"
    INSTALL_DIR="$HOME/.local/bin"
    DESKTOP_DIR="$HOME/.local/share/applications"
    DESKTOP_FILE="$DESKTOP_DIR/dnfupdate.desktop"
    DESKTOP_FILE_ICON="dnfupdateicon.png"
    
    mkdir -p "$INSTALL_DIR"
    mkdir -p "$DESKTOP_DIR"
    mkdir -p "$HOME/.local/share/icons/hicolor/512x512/apps/"
    
    cp "$SCRIPT_NAME" "$INSTALL_DIR/dnfupdate.sh"
    cp "$DESKTOP_FILE_ICON" "$HOME/.local/share/icons/hicolor/512x512/apps/"
    chmod +x "$INSTALL_DIR/$SCRIPT_NAME"
    
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
Icon=$HOME/.local/share/icons/hicolor/512x512/apps/dnfupdateicon.png
Terminal=false
Type=Application
Categories=System;
EOF
elif [[ "$answer" == "a" ]]; then
    SCRIPT_NAME="pacman-update.sh"
    INSTALL_DIR="$HOME/.local/bin"
    DESKTOP_DIR="$HOME/.local/share/applications"
    DESKTOP_FILE="$DESKTOP_DIR/pacman-update.desktop"
    DESKTOP_FILE_ICON="dnfupdateicon.png"

    read -r -p "Which AUR Helper do you have? For yay press 1 for paru press 2 " answer_1

    if [[ "$answer_1" == "1" ]]; then
        AURHELPER=yay
    elif [[ "$answer_1" == "2" ]]; then
        AURHELPER=paru
    else
        echo "You didn't provide defined answer, please, restart the script and try again..."
        exit 1
    fi
    mkdir -p "$INSTALL_DIR"
    mkdir -p "$DESKTOP_DIR"
    mkdir -p "$HOME/.local/share/icons/hicolor/512x512/apps/"
    
    cp "$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
    cp "$DESKTOP_FILE_ICON" "$HOME/.local/share/icons/hicolor/512x512/apps/"
    chmod +x "$INSTALL_DIR/$SCRIPT_NAME"
    sed -i "3s/.*/AURHELPER=${AURHELPER}/" "$INSTALL_DIR/$SCRIPT_NAME"
    
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
Name=Pacman Update
Comment=Update system packages
Exec=$TERMINAL bash -c "$INSTALL_DIR/pacman-update.sh; exec bash"
Icon=$HOME/.local/share/icons/hicolor/512x512/apps/dnfupdateicon.png
Terminal=false
Type=Application
Categories=System;
EOF
else
    echo "Aborted."
fi

echo "Done! The script installed to $INSTALL_DIR"
echo "You may need to re-login for the app menu entry to appear."