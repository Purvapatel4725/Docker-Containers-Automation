#!bin/bash

docker run -d --name=firefox --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -e FIREFOX_CLI=https://purvapatel4725.github.io/purvapatel/ -p 5000:3000 --shm-size="1gb" --restart unless-stopped lscr.io/linuxserver/firefox:latest
