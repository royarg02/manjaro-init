#!/usr/bin/env bash

##! NEEDS sudo

## Set time correctly
echo "Setting system time correctly..."
timedatectl set-local-rtc 1 --adjust-system-clock

## Update arch
##
## Updates system packages to install user packages later

## Set correct mirror
sudo pacman-mirrors -c India

## Update through pacman
sudo pacman -Syyu

