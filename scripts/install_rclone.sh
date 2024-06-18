#!/bin/bash

sudo zypper in rclone

rclone config

mkdir -p ~/.config/systemd/user
ln -s ~/.dotfiles/systemd/rclone-onedrive.service ~/.config/systemd/user/ \
tee systemctl --user daemon-reload \
tee systemctl --user enable --now rclone-onedrive


