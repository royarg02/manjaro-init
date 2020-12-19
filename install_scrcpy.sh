#!/usr/bin/env sh

### [scrcpy] has a dependency on [android-tools], but it's unnecessary
### as we already have [android-tools] bundled with Android SDK.
###
### This script modifies the PKGBUILD to remove the dependency and
### then installs the package.

## Store the directory we are currently on.
currWD=$(pwd)

## Move to /tmp and obtain the PKGBUILD.
cd /tmp || exit
yay -Gf scrcpy

## Inform that the PKGBUILD is being modified.
echo
echo "[INFO] Opening PKGBUILD of scrcpy to remove android-tools dependency..."

## Modify PKGBUILD.
## We assume that "android-tools" appears for the first time in the
## dependency section.
cd ./scrcpy || exit
sed -i "s/'android-tools' //" PKGBUILD

## Build the package, install it, and cleanup.
echo
echo "[INFO] Installing scrcpy..."
makepkg -sci

## Move back to directory we were previously after installation.
cd "$currWD" || exit 1
