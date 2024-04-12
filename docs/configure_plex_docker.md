# Configuring plex server

-------------------------------------------------------------------------------

1. Make sure docker is installed

2. If accessing outside the network, make sure router and DNS is correctly 
configured or tunnel is connected.

3. Create a `plex` user for security. Under this user, then create the 
`/media` directory. Inside that directory create `plex_media`, 
`plex_db`, and `plex_tc`. These will be the persistent volumes for the docker.

4. Use plex's naming schema and place media into `plex_media`

5. Start docker container using the following command. You will need to follow 
the directions on how to claim a plex media server on your plex account.

```bash
docker run -d --name=plex --network=host --restart unless-stopped \
-e PLEX_UID="uid of plex user" -e PLEX_GID="gid of plex group" \
-e TZ="your timezone" -e VERSION=docker \
-v /media/plex/plex_db:/config \
-v /media/plex/plex_tc:/transcode \
-v /media/plex/plex_media:/data \
plexinc/pms-docker
```

6. Once you have a claim token, stop and delete the container:

```bash
sudo docker stop plex 
sudo docker rm plex

```

7. Now run the following command, replacing <CLAIM_TOKEN> with your claim token.

```bash
docker run -d --name=plex --network=host --restart unless-stopped \
-e PLEX_UID="uid of plex user" -e PLEX_GID="gid of plex group" \
-e TZ="your timezone" -e VERSION=docker \
-e PLEX_CLAIM="CLAIM_TOKEN" \
-v /media/plex/plex_db:/config \
-v /media/plex/plex_tc:/transcode \
-v /media/plex/plex_media:/data \
plexinc/pms-docker
```

9. Optionally, you do not have to claim the server, but you won't be able to 
associate it with your plex account.

10. The media server should be running now. You may need to change some settings
in the remote tab under settings in order to access the server outside the local
network.

11. Next, create a cronjob to keep the server up to date. Start by creating a 
directory for the logs `/media/plex/logs`

12. Then, modify the crontab file `/etc/crontab` as root and add the following 
line:

```bash
0 4 * * * root /usr/bin/docker restart plex > /media/plex/logs/plex_updater_log
```

13. Congrats, your new docker should restart every morning at 4AM! Check the 
following day to see if the job has run correctly in the `plex_updater_log`
