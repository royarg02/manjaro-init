#!/usr/bin/env sh

## Check for root user
[ "$(id -u)" -ne 0 ] && \
echo "[ERROR] Initial setup requires root access to run properly." && exit 1

## Set time correctly
echo "[INFO] Setting system time correctly..."
timedatectl set-ntp 1
timedatectl set-local-rtc 1 --adjust-system-clock

## Set correct mirror
echo "[INFO] Configuring pacman mirrors..."
pacman-mirrors --fasttrack

## Update through pacman
echo "[INFO] Updating packages..."
pacman -Syyu
