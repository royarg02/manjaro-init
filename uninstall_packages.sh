#!/usr/bin/env sh

### Uninstalls the list of packages in a file, using pacman.
###
### Usage: uninstall_packages.sh [-y] -f [FILE]
###
### [FILE] can be any file that lists the packages to uninstall using pacman.
### See files in ../package_list for examples.
###
### -y skips the confirmation needed for installing.

### Displays the usage of the script.
usage() {
    printf "Usage: uninstall_packages.sh [-y] -f [FILE]\n\n"

    printf "\t-y: Skip confirmation for install.\n\n"

    printf "\t[FILE]: Path to file containing the list of packages.\n"
    exit 0
}

[ -r ./regex_match.sh ] && . ./regex_match.sh || exit 1

SHOW_CONFIRMATION=0     #true

while getopts ":yf:" opt
do
    case "$opt" in
        f) FILE="$OPTARG";;
        y) SHOW_CONFIRMATION=1;;    #false
        \?) usage
    esac
done

## If no arguments are supplied, display usage
[ "$OPTIND" -eq 1 ] && usage

## Check for proper arguments
[ ! -f "$FILE" ] && \
echo "[ERROR] Couldn't find the file \"$FILE\". Are you sure it exists?" && exit 1

## Load packages
echo "[INFO] Loading packages listed in \"$FILE\" to uninstall..."
packages=$(sed -e 's/^#.*$//' -e '/^$/d' "$FILE" | tr '\n' ' ')

## Get confirmation
if [ "$SHOW_CONFIRMATION" -eq 0 ]
then
    echo "[INFO] The script will now run \"pacman -Rcns\" for each package in \"$FILE\"."
    printf "Continue?(Y/n): "
    read -r confirm

    if regex_match "$confirm" 'n\|N'
    then
        echo "[INFO] Install aborted."
        exit 0
    fi
fi

## Uninstall packages
for i in $packages
do
    echo "[INFO] Uninstalling $i..."
    echo

    ## Query pacman to find the package. If it doesn't exist in the first place,
    ## skip this iteration
    pacman -Q "$i" >/dev/null 2>&1
    [ $? -eq 1 ] && echo "[INFO] Couldn't find package $i. Skipping..." && \
    continue

    pacman -Rcns "$i"
    ## If uninstalling fails, quit immediately.
    [ $? -eq 1 ] && \
    echo "[ERROR] Something went wrong. Refer to output for possible reasons." \
    && exit 1
done

echo "[INFO] Uninstall finished successfully."

unset FILE SHOW_CONFIRMATION
unset -f usage regex_match
exit 0
