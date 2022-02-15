#!/usr/bin/env sh

### Uninstalls packages listed in `uninstall_pacman.txt`

## Check for root user
[ "$(id -u)" -ne 0 ] && \
echo "[ERROR] Uninstalling packages requires root access to run properly." && \
exit 1

### Source `uninstall_packages.sh`
[ -r ./uninstall_packages.sh ] && . ./uninstall_packages.sh || exit 1

## Load and uninstall packages listed in `uninstall_pacman.txt`
uninstallPackages -f "./package_list/uninstall_pacman.txt"
