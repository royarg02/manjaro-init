#!/usr/bin/env sh

### Starts some systemd services after install

## Check for root user
if [ "$(id -u)" -ne 0 ]
then
    echo "[ERROR] Starting up systemd services requires root access."
    exit 1
fi

## Copy powertop.service from user_files
cp ./user_files/etc/systemd/system/powertop.service /etc/systemd/system/

## Enable powertop service for auto tune
systemctl enable powertop.service

## Enable tor service
systemctl enable tor.service

## Enable cups service
systemctl enable --now org.cups.cupsd.service
