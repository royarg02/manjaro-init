#!/usr/bin/env sh

### Installs the list of packages in a file, using either pacman or yay.
###
### Usage: install_packages.sh [-n][-y] -m [MANAGER] -f [FILE]
###
### [MANAGER] can be:
### * pacman, the default package manager for arch linux based systems.
### * yay, a package manager to install packages from the Arch User
###   Repository(AUR).
###
### [FILE] can be any file that lists the packages to install by either of
### these package managers. See files in ../package_list for examples.
###
### -n switches on the --needed flag for these package managers, which when
### applied, do not reinstall packages which are already up to date(which is the
### default behaviour).
###
### -y skips the confirmation needed for installing.
###
### By default, uses pacman with the -n flag unsetted showing confirmation.
###
### yay has a --needed option, but it still re-downloads sources of installed
### packages. -n has thus been deliberately made to be ignored if yay is used.
###
### See #885 of github.com/Jguer/yay for more context.

### Displays the usage of the script.
usage() {
    printf "Usage: install_packages.sh [-n][-y] -m [MANAGER] -f [FILE]\n\n"

    printf "\t-n: Reinstall up to date packages(equivalent to --needed)\n\n"

    printf "\t-y: Skip confirmation for install.\n\n"

    printf "\t[MANAGER]:\n"
    printf "\t\t* pacman, the default package manager for arch linux based systems.\n"
    printf "\t\t* yay, a package manager to install packages from the Arch User Repository(AUR).\n\n"

    printf "\t[FILE]: Path to file containing the list of packages.\n"
    exit 0
}

[ -r ./regex_match.sh ] && . ./regex_match.sh || exit 1

unset MANAGER NEEDED FILE SHOW_CONFIRMATION

NEEDED=''
SHOW_CONFIRMATION=0     #true

while getopts ":nym:f:" opt
do
    case "$opt" in
        n) NEEDED=" --needed";;
        m) MANAGER="$OPTARG";;
        f) FILE="$OPTARG";;
        y) SHOW_CONFIRMATION=1;;    #false
        \?) usage
    esac
done

## If no arguments are supplied, display usage
if [ "$OPTIND" -eq 1 ]
then
   usage
fi


## Default parameters
MANAGER=${MANAGER:-'pacman'}

## Check for proper arguments
if [ ! -f "$FILE" ]
then
    echo "[ERROR] Couldn't find the file \"$FILE\". Are you sure it exists?"
    exit 1
elif ! regex_match "$MANAGER" 'yay\|pacman'
then
    echo "[ERROR] Invalid manager \"$MANAGER\". Only \"pacman\" and \"yay\" can be managers."
    exit 1
fi

## Ignore the -n flag if manager is yay
if regex_match "$MANAGER" 'yay' && regex_match "$NEEDED" '--needed'
then
    NEEDED=''
fi

## Load packages
echo "[INFO] Loading packages listed in \"$FILE\" to install..."
echo
packages=$(sed -e 's/^#.*$//' -e '/^$/d' "$FILE" | tr '\n' ' ')

## Get confirmation
if [ "$SHOW_CONFIRMATION" -eq 0 ]
then
    echo "[INFO] The script will now run \"$MANAGER -S$NEEDED\" for each package in \"$FILE\"."
    printf "Continue?(Y/n): "
    read -r confirm

    if regex_match "$confirm" 'n\|N'
    then
        echo "[INFO] Install aborted."
        exit 0
    fi
fi

## Install packages
for i in $packages
do
    echo "[INFO] Installing $i..."
    echo
    "$MANAGER" -S"$NEEDED" "$i"
    ## If installing fails, quit immediately.
    if [ $? -eq 1 ]
    then
        echo "[ERROR] Something went wrong. Refer to output for possible reasons."
        exit 1
    fi
done

echo "[INFO] Install finished successfully."
exit 0
