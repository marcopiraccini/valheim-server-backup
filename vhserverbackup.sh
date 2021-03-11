#!/bin/bash

worldname="Cialthronesgard"
now=$(date +"%d-%m-%Y-%H-%M")

# Stop the Service
systemctl stop valheimserver.service

# Create the Backup

# create the new folder
mkdir /home/steam/backups/${now}

# copy the files
cp /home/steam/.config/unity3d/IronGate/Valheim/worlds/${worldname}.db /home/steam/backups/${now}/${worldname}.db
cp /home/steam/.config/unity3d/IronGate/Valheim/worlds/${worldname}.fwl /home/steam/backups/${now}/${worldname}.fwl

# clear backups older than 30 days
# /usr/local/sbin/vhclearbackups.sh

# Start the Service
systemctl start valheimserver.service

sleep 30s

# check if service is running and post to discord if running or not
# systemctl is-active --quiet valheimserver.service >/dev/null 2>&1 && /usr/local/sbin/discord.sh --webhook-url="${discordwebhook}" --text "Valheim Server back ONLINE! Happy gaming!" || /usr/local/sbin/discord.sh --webhook-url="${discordwebhook}" --text "Valheim Server not started. Please check..."
