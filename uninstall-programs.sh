#!/usr/bin/env bash

##! NEEDS sudo

## Uninstall programs
##
## Uninstalls some system programs which are not required

# Uninstall GtkHash
echo "Uninstalling gtkHash..."
sudo pacman -Rcns gtkhash
echo "Uninstalling gtkHash-thunar..."
sudo pacman -Rcns gtkhash-thunar

# Uninstall Manjaro Hello
echo "Uninstalling manjaro-hello..."
sudo pacman -Rcns manjaro-hello

# Uninstall Manjaro browser settings
echo "Uninstalling manjaro-browser-settings..."
sudo pacman -Rcns manjaro-browser-settings

# Uninstall Manjaro user guide
echo "Uninstalling manjaro-documentaion-en..."
sudo pacman -Rcns manjaro-documentation-en

# Uninstall Android-tools
echo "Uninstalling android-tools..."
sudo pacman -Rcns android-tools

# Uninstall Midori
echo "Uninstalling midori..."
sudo pacman -Rcns midori

# Uninstall Orage
echo "Uninstalling orage..."
sudo pacman -Rcns orage

# Uninstall Qpdfview
echo "Uninstalling qpdfview..."
sudo pacman -Rcns qpdfview

# Uninstall Parole media player
echo "Uninstalling parole..."
sudo pacman -Rcns parole
