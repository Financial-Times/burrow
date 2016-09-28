# burrow - Kafka Consumer Lag Checking

Tool for viewing information about kafka via REST. Based on [github.com/linkedin/Burrow](https://github.com/linkedin/Burrow)

## Run locally

1. Either you open two tunnels for the two ports for Kafka and Zookeeper in one of our clusters: `ssh -L 9092:localhost:9092 core@xp-tunnel-up.ft.com` & `ssh -L 2181:localhost:2181 core@xp-tunnel-up.ft.com`
or you [download and run kafka locally](http://kafka.apache.org/documentation.html#quickstart) (this is recommended more).
2. `go get github.com/linkedin/Burrow`
3. `cd $GOPATH/src/github.com/linkedin/Burrow`
4. `git checkout v0.1.1`
4. `gpm install`
5. `go install`
6. `Burrow --config config/burrow.cfg`

Burrow, simply got from github, to be run with the configuration set up in this project's config.
You can try querying it [on its REST endpoints](https://github.com/linkedin/Burrow/wiki/HTTP-Endpoint) to give you information about your Kafka. e.g.

`curl localhost:8081/v2/kafka/local/consumer`

## Info

Logs of Burrow are in `burrow.out` as well inside the container.

See also:

* [Configuration](https://github.com/linkedin/Burrow/wiki/Configuration)
