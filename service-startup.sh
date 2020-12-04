#!/usr/bin/env bash

### starts some systemd services after install

# Copy powertop.service from user_files
sudo cp ./user_files/etc/systemd/system/powertop.service /etc/systemd/system/

# Enable powertop service for auto tune
systemctl enable powertop.service

# Enable tor service
systemctl enable tor.service

# Enable cups service
sudo systemctl enable --now org.cups.cupsd.service
