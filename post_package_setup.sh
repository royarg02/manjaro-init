#!/usr/bin/env sh

### Does some post-install/uninstall jobs.
## Check for root user
if [ "$(id -u)" -ne 0 ]
then
    echo "[ERROR] Post install/uninstall setup requires root access to run properly."
    exit 1
fi

## Create a link of 'vi' to vim
ln -s /usr/bin/vim /usr/bin/vi
