#!/bin/bash
cd "$(dirname "$0")"
rm -rf logs/*.gz
#DISCORD=$(cat ~/.discord_token)
#MYSQL_DATABASE=$(cat ~/.mysql_database)
#MYSQL_USER=$(cat ~/.mysql_user)
#MYSQL_PASSWORD=$(cat ~/.mysql_password)
#MYSQL_HOST=$(cat ~/.mysql_host)
#MONGO=$(cat ~/.mongo)
JAR="Travertine.jar"
RAM_MIN="1G"
RAM_MAX="2G"
CPU_CORES="1"
java -server -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=$CPU_CORES -XX:+AggressiveOpts -Xms$RAM_MIN -Xmx$RAM_MAX -jar $JAR nogui
