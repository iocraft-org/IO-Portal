#!/bin/bash
cd "$(dirname "$0")"
rm -rf logs/*.gz
#DISCORD=$(cat ~/.discord_token)
#WP_USER=$(cat ~/.wp_username)
#WP_PASS=$(cat ~/.wp_password)
MYSQL_DATABASE=$(cat ~/.mysql_database)
MYSQL_USERNAME=$(cat ~/.mysql_username)
MYSQL_PASSWORD=$(cat ~/.mysql_password)
MYSQL_HOSTNAME=$(cat ~/.mysql_hostname)
#IRC_PASSWORD=$(cat ~/.irc_password)
#MCR_PASS=$(cat ~/.mcr_pass)
#MONGO=$(cat ~/.mongo)
JAR="Travertine.jar"
RAM_MIN="1G"
RAM_MAX="2G"
CPU_CORES="1"
screen -S iogame -X quit
sh start.sh
