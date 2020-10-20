#!/usr/bin/env bash

## Service startup
##
## starts some systemd services after install

systemctl enable powertop.service
systemctl enable tor.service

