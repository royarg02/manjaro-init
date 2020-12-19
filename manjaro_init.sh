#!/usr/bin/env sh

## Change permissions to execute
chmod +x initial_setup.sh install_scrcpy.sh install_programs.sh post_package_setup.sh uninstall_programs.sh service_startup.sh

## Run scripts
sudo ./initial_setup.sh
./install_packages_main.sh
## yay must not be run as sudo
./install_scrcpy.sh
sudo ./uninstall_packages_main.sh
sudo ./post_package_setup.sh
sudo ./service_startup.sh

exit 0