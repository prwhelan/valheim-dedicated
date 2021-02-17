FROM cm2network/steamcmd:latest

# Downloading the Dedicated Server

ENV SERVER_DIR=/home/steam/valheim-dedicated
ENV SERVER_APP_ID=896660

# STEAMCMDDIR is set in steamcmd:latest
RUN ${STEAMCMDDIR}/steamcmd.sh +login anonymous +force_install_dir ${SERVER_DIR} +app_update ${SERVER_APP_ID} +exit

# The steamcmd image puts us in the steamcmd directory, let's go back to root if we need to shell in
WORKDIR /

# Starting the Server
# Configuration required for us to find and connect to the server
ENV SERVER_NAME="Basic Docker Server"
ENV SERVER_PASSWORD=12345
ENV SERVER_PORT=2456
ENV PUBLIC=1

# If you're importing a world, this name must match the filename (the text before the .fwl)
ENV WORLD_NAME="Yggdrasil"

# The save location for the world.  Using an external volume as a means to backup the world
VOLUME /home/steam/.config/unity3d/IronGate/Valheim

# Configuration the server needs to run
# This is taken from the "start-server.sh" file that steamcmd downloads
ENV SteamAppId=892970
ENV LD_LIBRARY_PATH=${SERVER_DIR}/linux64:${LD_LIBRARY_PATH}
EXPOSE 2456-2458/udp

ENTRYPOINT ${SERVER_DIR}/valheim_server.x86_64 -name "${SERVER_NAME}" -port ${SERVER_PORT} -world "${WORLD_NAME}" -password "${SERVER_PASSWORD}" -public ${PUBLIC}
