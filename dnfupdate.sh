#!/bin/bash

sudo dnf check-upgrade --refresh

read -p "Which type of update would you like to perform? For usual update press "u", for offline update press "o":" answer
if [[ "$answer" == "o" ]]; then
    echo "Proceeding..."
    flatpak update -y
    sudo dnf offline-upgrade download --refresh -y
    sudo dnf offline reboot -y
    exit
elif [[ "$answer" == "u" ]]; then
    echo "Proceeding..."
    flatpak update -y
    sudo dnf check-upgrade --refresh -y
    sudo dnf update -y
    exit
else
    echo "Aborted."
fi

