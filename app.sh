#!/bin/bash

sleep 30

sudo apt update
sudo apt upgrade -y

sudo apt install software-properties-common

sudo add-apt-repository multiverse; sudo dpkg --add-architecture i386; sudo apt update
sudo apt install steamcmd

steamcmd +force_install_dir '/home/steam/Steam/steamapps/common/steamworks' +login anonymous +app_update 1007 +quit
mkdir -p /home/steam/.steam/sdk64
cp '/home/steam/Steam/steamapps/common/steamworks/linux64/steamclient.so' /home/steam/.steam/sdk64/
steamcmd +force_install_dir '/home/steam/Steam/steamapps/common/PalServer' +login anonymous +app_update 2394010 validate +quit




