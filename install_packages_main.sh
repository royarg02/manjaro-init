#!/usr/bin/env sh

### Installs packages listed in following files, in order:
###
### * `install_pacman.txt`
### * `install_pacman_needed.txt`
### * `install_yay`.txt

### Source `install_packages.sh`
[ -r ./install_packages.sh ] && . ./install_packages.sh || exit 1

## Load and install packages listed in `install_pacman.txt`.
sudo installPackages -m "pacman" -f "./package_list/install_pacman.txt"

## Load and install packages listed in `install_pacman_needed.txt`.
sudo installPackages -nm "pacman" -f "./package_list/install_pacman_needed.txt"

## Load and install packages listed in `install_yay.txt`.
##
## yay must not be run as sudo
installPackages -m "yay" -f "./package_list/install_yay.txt"
