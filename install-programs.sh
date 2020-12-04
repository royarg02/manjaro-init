#!/usr/bin/env bash

### Installs packages listed in following files, in order:
###
### * `install_pacman.txt`
### * `install_pacman_needed.txt`
### * `install_yay`.txt
###
### Then runs `install-scrcpy.sh` to install the scrcpy package.

### Installs the list of packages in a file, using either pacman or yay.
###
### By default, uses pacman and installs without `--needed` flag.
###
### If [manager] is yay, `--needed` must not be true.
###
### Any failure will be reported and the script will quit immediately.
###
### Takes the file, the manager, and the --needed flag in order.
function installPackages {
  ## Default parameters
  local manager=${2:-'pacman'}
  local needed=${3:-false}

  ## Check for proper arguments
  if [[ ! -f "$1" ]]
  then
    echo -e "\n[ERROR] Couldn't find the file $1. Are you sure it exists in the current directory?\n"
    exit 1
  elif [[ $2 =~ "^(yay|pacman)" ]]
  then
    echo -e "\n[ERROR] Invalid manager $1. Only \"pacman\" and \"yay\" can be managers.\n"
    exit 1
  elif [[ $3 -ne false -o $3 -ne true ]]
    echo -e "\n[ERROR] Invalid value $3 to --needed flag. Only true or false is allowed.\n"
    exit 1
  elif [[ $2 =~ "yay" -a $3 -eq true ]]
    echo -e "\n[ERROR] Manager and --needed flag cannot be $2 and $3 simultaneously.\n"
    exit 1
  fi

  local neededFlag
  if [[ $needed ]]
  then
    neededFlag=" --needed"
  else
    neededFlag=" "
  fi

  ## Load packages
  echo -e "\n[INFO] Loading packages listed in $1 to install...\n"
  packages=($(sed 's/^#.*//g' $1 | tr '\n' ' '))

  ## Install packages
  for i in "${packages[@]}"
  do
  echo -e "\n[INSTALL] Installing $i...\n"
  sudo "$2" -S"$neededFlag" "$i"
  ## If installing fails, quit immediately.
  if [[ $? -eq 1]]
  then
    echo -e "\n[ERROR] Something went wrong. Refer to output for possible reasons.\n"
    exit 1
  fi
  done
}

## Load and install packages listed in `install_pacman.txt`.
installPackages "install_pacman.txt"

## Load and install packages listed in `install_pacman_needed.txt`.
installPackages "install_pacman_needed.txt" "pacman" true

## Load and install packages listed in `install_yay.txt`.
installPackages "install_yay.txt" "yay"

## Install scrcpy.
./install_scrcpy.sh
