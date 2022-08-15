#!/bin/sh
sed -i "s ZOOKEEPER_HOST $ZOOKEEPER_HOST " /config/burrow.toml
sed -i "s ZOOKEEPER_PORT $ZOOKEEPER_PORT " /config/burrow.toml
sed -i "s KAFKA_HOST $KAFKA_HOST " /config/burrow.toml
sed -i "s KAFKA_PORT $KAFKA_PORT " /config/burrow.toml

cat /config/burrow.toml

./Burrow --config-dir /config
