#!/bin/bash

docker run -d --name=libreoffice --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC -p 3005:3000 -p 3006:3001 --restart unless-stopped lscr.io/linuxserver/libreoffice:latest
