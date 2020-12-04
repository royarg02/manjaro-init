#!/usr/bin/env bash

### Uninstalls packages listed in `uninstall_pacman.txt`

### Uninstalls the list of packages in a file, using pacman.
###
### Any failure will be reported and the script will quit immediately.
###
### Takes the file as an argument.
function uninstallPackages {
  ## Check for proper arguments
  if [[ ! -f "$1" ]]
  then
    echo -e "\n[ERROR] Couldn't find the file $1. Are you sure it exists in the current directory?\n"
    exit 1
  fi

  ## Load packages
  echo -e "\n[INFO] Loading packages listed in $1 to uninstall...\n"
  packages=($(sed 's/^#.*//g' $1 | tr '\n' ' '))

  ## Uninstall packages
  for i in "${packages[@]}"
  do
  echo -e "\n[UNINSTALL] Uninstalling $i...\n"
  sudo pacman -Rcns "$i"
  ## If uninstalling fails, quit immediately.
  if [[ $? -eq 1]]
  then
    echo -e "\n[ERROR] Something went wrong. Refer to output for possible reasons.\n"
    exit 1
  fi
  done
}

## Load and uninstall packages listed in `uninstall_pacman.txt`
uninstallPackages "uninstall_pacman.txt"
