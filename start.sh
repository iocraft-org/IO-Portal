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
if ! screen -list | grep -q "iogame"; then
	echo "Server is starting!"

	# MySQL BungeePexBridge
	rm plugins/BungeePexBridge/config.yml;
	sed "s#MYSQL_DATABASE#$MYSQL_DATABASE#g" plugins/BungeePexBridge/config.yml.template > plugins/BungeePexBridge/config.yml;
	sed -i "s/MYSQL_USERNAME/$MYSQL_USERNAME/g" plugins/BungeePexBridge/config.yml;
	sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" plugins/BungeePexBridge/config.yml;
	sed -i "s/MYSQL_HOSTNAME/$MYSQL_HOSTNAME/g" plugins/BungeePexBridge/config.yml;

	sudo screen -dmS iogame sudo java -server -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=$CPU_CORES -XX:+AggressiveOpts -Xms$RAM_MIN -Xmx$RAM_MAX -jar $JAR nogui
else
	echo "Server already started!";
fi
