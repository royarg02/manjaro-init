#!/usr/bin/env sh

### Starts some systemd services after install

## Check for root user
[ "$(id -u)" -ne 0 ] && \
echo "[ERROR] Starting up systemd services requires root access." && exit 1

## Enable tor service
systemctl enable tor.service

## Enable cups service
systemctl enable --now org.cups.cupsd.service
