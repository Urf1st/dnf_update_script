#!/bin/bash

sudo dnf check-upgrade --refresh
if [[ -z $(flatpak remote-ls --updates) ]]; then
    echo "No Flatpak updates were found"
fi

read -r -p 'Which type of update would you like to perform? For usual update press "u", for offline update press "o":' answer
if [[ "$answer" == "o" ]]; then
    echo "Proceeding..."
    flatpak update -y
    sudo dnf offline-upgrade download --refresh -y
    sudo dnf offline reboot -y
elif [[ "$answer" == "u" ]]; then
    echo "Proceeding..."
    flatpak update -y
    sudo dnf update -y
    exit
else
    echo "Aborted."
fi

