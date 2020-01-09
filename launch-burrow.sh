#!/bin/sh
ZOOKEEPER_URL=\\\"$(echo $ZOOKEEPER_URL | sed 's/,/\\\", \\\"/g')\\\"
sed -i -e "s/ZOOKEEPER_URL/$ZOOKEEPER_URL/" /config/burrow.toml
KAFKA_URL=\"$(echo $KAFKA_URL | sed 's/,/", "/g')\"
sed -i -e "s/KAFKA_URL/$KAFKA_URL/" /config/burrow.toml

cat /config/burrow.toml

/Burrow --config-dir /config
