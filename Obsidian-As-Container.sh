#!/bin/bash

docker run -d --name=obsidian --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -p 3003:3000 -p 3004:3001 --shm-size="1gb" --restart unless-stopped lscr.io/linuxserver/obsidian:latest