#!/bin/bash

AURHELPER=paru

checkupdates; $AURHELPER -Qua
if [[ -z $(flatpak remote-ls --updates) ]]; then
    echo "No Flatpak updates were found"
fi
read -r -p 'Which type of update would you like to perform? For usual update press "o", for update without confirmations press "z":' answer
if [[ "$answer" == "o" ]]; then
    echo "Updating system with $AURHELPER"
    $AURHELPER -Syu
    flatpak update 
    flatpak remove --unused 
    stale_downloads=$(sudo find /var/cache/pacman/pkg -maxdepth 1 -type d -name "download-*")
    if [[ -n "$stale_downloads" ]]; then
        echo "$stale_downloads"
        read -r -p 'Do you want to delete these files? (y/n) ' answer_del
        if [[ "$answer_del" == "y" ]]; then
            sudo find /var/cache/pacman/pkg -maxdepth 1 -type d -name "download-*" -exec rm -rvf {} +
        else
            echo "Skipped deletion..."
        fi
    else
        echo "No stale download-* entries found in cache."
    fi
    sudo paccache -r
    $AURHELPER -Sc 
    $AURHELPER -c 
elif [[ "$answer" == "z" ]]; then
    echo "Updating system with $AURHELPER"
    $AURHELPER -Syu --noconfirm
    flatpak update -y
    flatpak remove --unused -y
    sudo find /var/cache/pacman/pkg -maxdepth 1 -type d -name "download-*" -exec rm -rvf {} +
    sudo paccache -r
    $AURHELPER -Sc --noconfirm
    $AURHELPER -c --noconfirm
else
    echo "Aborted."
    exit
fi
