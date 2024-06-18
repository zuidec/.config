#!/bin/bash

sudo zypper in rclone

mkdir -p ~/Documents/OneDrive
rclone config

mkdir -p ~/.config/systemd/user
ln -s ~/.dotfiles/systemd/user/rclone-onedrive.service ~/.config/systemd/user/ \
tee systemctl --user daemon-reload \
tee systemctl --user enable --now rclone-onedrive


