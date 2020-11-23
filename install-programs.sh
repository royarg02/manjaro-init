#!/usr/bin/env bash

## NEEDS sudo

## Install programs
##
## Installs packages upon fresh install

## Install vim

# Check whether vim is installed in the first place
which vim > /dev/null 2>&1

isVimInstalled=$(echo $?)

if [[ isVimInstalled -eq 0 ]]
then
  echo "Vim is already installed."
else
  echo "Vim is not installed."
fi

# Check whether vi is installed
which vi > /dev/null 2>&1

isViInstalled=$(echo $?)

# If vi is installed, remove vi
if [[ isViInstalled -eq 0 ]]
then
  echo "Vi is installed, uninstalling vi..."
  sudo pacman -Rcns vi
else
  echo "Vi is not installed."
fi

# Install vim
echo "Installing vim..."
sudo pacman -S vim

# Create a link of 'vi' to vim
sudo ln -s /usr/bin/vim /usr/bin/vi

# Create config files, if necessary
if [[ ! -e ~/.vimrc ]]
then
  cp ./user_files/.vimrc ~/
fi

## Install Neofetch
echo "Installing neofetch..."
sudo pacman -S neofetch

## Install Firefox
echo "Installing firefox..."
sudo pacman -S firefox

## Install Yay
echo "Installing yay..."
sudo pacman -S yay

## Install Chromium
echo "Installing chromium..."
sudo pacman -S chromium

## Install Base-devel(for yay)
echo "Installing base-devel..."
sudo pacman -S base-devel --needed

## Install Clang
echo "Installing clang..."
sudo pacman -S clang

## Install Cmake
echo "Installing cmake..."
sudo pacman -S cmake

## Install Ninja
echo "Installing ninja..."
sudo pacman -S ninja

## Install xfce4-docklike-plugin
echo "Installing xfce4-docklike-plugin..."
yay -S xfce4-docklike-plugin-git

## Install VSCodium
echo "Installing VSCodium..."
yay -S vscodium-bin

## Install GIMP
echo "Installing gimp..."
sudo pacman -S gimp

## Install ms-fonts
echo "Installing ttf-ms-fonts..."
yay -S ttf-ms-fonts

## Install ttf-windows
echo "installing ttf-windows..."
yay -S ttf-windows

## Install libreoffice-fresh
echo "Installing libreoffice-fresh..."
sudo pacman -S libreoffice-fresh

## Install OBS
echo "Installing obs-studio..."
sudo pacman -S obs-studio
yay -S obs-v4l2sink

## Install Remmina
echo "Installing Remmina..."
sudo pacman -S remmina

## Install scrcpy
echo "Installing scrcpy..."
currWD=$(pwd)
cd
yay -Gf scrcpy
echo "Opening PKGBUILD to remove android-tools dependency..."
sleep 5
cd ./scrcpy
vi PKGBUILD
makepkg -si
sudo pacman -Rcns meson
cd $currWD

## Install shellcheck
echo "Installing shellcheck..."
sudo pacman -S shellcheck

## Install tldr
echo "installing tldr..."
sudo pacman -S tldr

## Install transmission
echo "Installing transmission..."
sudo pacman -S transmission-gtk

## Install typora
echo "Installing typora..."
yay -S typora

## Install VLC
echo "Installing vlc..."
sudo pacman -S vlc

## Install steam
echo "Installing steam..."
sudo pacman -S steam

## Install tor
echo "Installing tor..."
sudo pacman -S tor

## Install optimus-manager
echo "Installing optimus-manager..."
yay -S optimus-manager
yay -S optimus-manager-qt

## Install xclip
echo "Installing xclip..."
sudo pacman -S xcip

## Install xfce4-netload-plugin
echo "Installing xfce4-netload-plugin..."
sudo pacman -S xfce4-netload-plugin

## Install font-manager
echo "Installing font-manager..."
sudo pacman -S font-manager

## Install Intellij IDEA
echo "Installing intellij-idea-community-edition..."
sudo pacman -S intellij-idea-community-edition

## Install Kotlin
echo "Installing kotlin..."
sudo pacman -S kotlin

## Install Ristretto
echo "Installing ristretto..."
sudo pacman -S ristretto

## Install Manjaro printer
echo "Installing manjaro-printer..."
sudo pacman -S manjaro-printer

## Install packages for git send-email
echo "Installing required packages for git send-email..."
sudo pacman -S --needed git perl-authen-sasl perl-net-smtp-ssl perl-mime-tools

## Install GNOME calculator
echo "Installing gnome-calculator..."
sudo pacman -S gnome-calculator

## Install Optipng
echo "Installing optipng..."
sudo pacman -S optipng

