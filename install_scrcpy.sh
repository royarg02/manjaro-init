#!/usr/bin/env bash

### [scrcpy] has a dependency on [android-tools], but it's unnecessary
### as we already have [android-tools] bundled with Android SDK.
###
### This script modifies the PKGBUILD to remove the dependency and
### then installs the package.

## Store the directory we are currently on.
currWD=$(pwd)

## Move to /tmp and obtain the PKGBUILD.
cd /tmp
yay -Gf scrcpy

## Inform that the PKGBUILD is being modified.
echo -e "\n[INFO] Opening PKGBUILD of scrcpy to remove android-tools dependency...\n"
sleep 2

## Modify PKGBUILD.
## We assume that "android-tools" appears for the first time in the
## dependency section .
cd ./scrcpy
sed -i "s/'android-tools' //" PKGBUILD

## Build the package, install it, and cleanup.
echo -e "\n[INSTALL] Installing scrcpy...\n"
makepkg -sci

## Move back to directory we were previously after installation.
cd "$currWD"

