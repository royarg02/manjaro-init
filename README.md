# Obsolete and archived: I don't use manjaro anymore

My dotfiles can be found at https://github.com/RoyARG02/user_files.

***

POSIX-compliant shell scripts that configure a fresh **Manjaro** install.

Currently only works with **Manjaro**, but may be updated to support Arch based distros as well.

## How to use

1. Clone the repository.
2. Run `chmod +x manjaro_init.sh`.
3. Run `./manjaro_init.sh`.

The script will ask for root privileges during run.

## Operations performed by the script

Running the script does the following operations:

1. `initial_setup.sh`: Some operations to perform before installation/uninstallation. Currently synchronizes system time with network, sets RTC time and updates the preinstalled packages.
2. `install_packages_main.sh`: Installs packages defined as per the files listed below.
3. `install_scrcpy.sh`: Installs [scrcpy](https://github.com/Genymobile/scrcpy) using `yay`. View its source code for the reason for keeping this seperate.
4. `uninstall_packages_main.sh`: Uninstalls packages defined as per the files listed below.
5. `post_package_setup.sh`: Some operations to perform after installation/uninstallation. Currently creates a soft link, "`vi`", to "`vim`".
6. `service_startup.sh`: Starts some `systemd` services for the packages installed.

## Package list

The list of packages are present in files in the `package_list` directory. Packages can be added, or removed, as per your wish:

- `./package_list/install_pacman.txt`: List of packages to be installed using pacman (`pacman -S <package_name>`).
- `./package_list/install_pacman_needed.txt`: List of packages which would be only installed if out of date (`pacman -S --needed <package_name>`).
- `./package_list/install_yay.txt`: List of packages to be installed using yay (`yay -S <package_name>`).
- `./package_list/uninstall_pacman.txt`: List of packages to be uninstalled using pacman (`pacman -Rcns <package_name>`).

## Install/Uninstall packages only

As stated above, the script does some additional functions other than just installing and uninstalling packages. If this is undesirable, the scripts `install_packages.sh` and `uninstall_packages.sh` can be run directly against a file listing the packages. Run either of these scripts without any arguments or passing a `-h` flag to see the usage.

## Caveats

- `yay` cannot be run as root. As such, the script may ask for root privileges _multiple_ times, specifically everytime when `pacman` runs.
- The scripts do not have any tests. I'm currently in the process of figuring out the best way.
- The [user_files](https://github.com/RoyARG02/user_files) repository deploys user files.
