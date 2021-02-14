# valheim-dedicated

## What is this?
This downloads and starts up a dedicated server for [Valheim](https://www.valheimgame.com/).

This is based off of [steamcmd](https://hub.docker.com/r/cm2network/steamcmd/) docker image, more documentation [here](https://developer.valvesoftware.com/wiki/SteamCMD).

## How do I use it?
Supply these environment variables to configure the server:
- `-e SERVER_NAME` is the name that will show up on the Valheim server list
- `-e SERVER_PASSWORD` is the password into your glorious world
- `-e WORLD_NAME` is the name of your glorious world

You will also need to forward these ports from your host:
- 2456/udp
- 2457/udp
- 2458/udp

And finally, share a VOLUME from the host: `-v "C:\Users\pwhel\Documents\valheim":/home/steam/.config/unity3d/IronGate/Valheim`. This is the directory that saves the state of the world.

Example: `docker run -dit -e SERVER_NAME=Yggdrasil -e SERVER_PASSWORD=12345 -e WORLD_NAME=Yggdrasil -v /home/pat/valheim/backup:/home/steam/.config/unity3d/IronGate/Valheim -p 2456-2458:2456-2458/udp valheim-dedicated`

## What do I need to run it?
No idea.  Currently, internet suggets 2 core CPU and 4 gigs RAM.

By default, the server idles at 1.3CPU and 1.7GB RAM.

