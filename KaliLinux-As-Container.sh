#!/bin/bash

docker run -d --name=kali-linux --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE="Kali Linux" -p 3000:3000 -p 3001:3001 --device /dev/dri:/dev/dri --shm-size="1gb" --restart unless-stopped lscr.io/linuxserver/kali-linux:latest
