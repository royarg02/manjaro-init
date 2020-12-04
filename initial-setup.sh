#!/usr/bin/env bash

## Set time correctly
echo "Setting system time correctly..."
timedatectl set-local-rtc 1 --adjust-system-clock

## Set correct mirror
sudo pacman-mirrors -c India

## Update through pacman
sudo pacman -Syyu
