# This guide is a reference on how to set up OneDrive on a linux machine.

-------------------------------------------------------------------------------

1. Install rclone
    `sudo apt install rclone` or `sudo zypper in rclone`

2. Configure rclone
    `rclone config`

3. Choose New remote by entering 'n'

```bash
    >>>No remotes found, make a new one?
    n) New remote
    s) Set configuration password
    q) Quit config
    n/s/q> n
```
    
4. Enter 'OneDrive' as the name of the remote.

5. Enter 'onedrive' as the storage type.

6. Leave client_id and client_secret empty.

7. Enter 1 for the region.

8. If asked, skip advanced configuration by entering 'n'

9. Use auto config

10. At this point a login screen should open in the web browser to login to your
OneDrive account.

11. Once you are logged in the webpage should say "Success!"

12. Go back to the terminal and enter 'onedrive' for config_type.

13. Confirm remote is OK by entering 'y'

14. If everything is okay, you should be back at the main screen and onedrive 
should be listed as a current remote.

15. Create a OneDrive directory `mkdir ~/Documents/OneDrive`

16. Create a systemd user folder if none exists in `~/.config/systemd/user`

17. Create file 'rclone-onedrive.service' in this directory.

18. The file should contain the following:

```bash
    [Unit]
    Description=OneDrive (rclone)
    AssertPathIsDirectory=%h/Documents/OneDrive
    After=network.target

    [Service]
    Type=simple

    ExecStart=/usr/bin/rclone --vfs-cache-mode writes mount OneDrive: %h/Documents/OneDrive

    ExecStop=/usr/bin/fusermount -zu %h/Documents/OneDrive

    Restart=on-failure
    RestartSec=15

    [Install]
    WantedBy=default.target
```
19. Reload the systemd daemons then enable the service:

```bash
    systemctl --user daemon-reload
    systemctl --user enable --now rclone-onedrive
```

20. Congrats! Your OneDrive should now be accessible in your home directory.
