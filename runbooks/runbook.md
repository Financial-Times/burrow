# UPP - Burrow

Burrow is a tool which allows viewing information about Kafka via REST API.

## Primary URL

https://upp-prod-delivery-glb.upp.ft.com/__burrow/

## Service Tier

Platinum

## Lifecycle Stage

Production

## Delivered By

content

## Supported By

content

## Known About By

- kalin.arsov
- mihail.mihaylov
- elitsa.pavlova
- hristo.georgiev

## Host Platform

AWS

## Architecture

This service runs a Docker image based on a very old version of https://github.com/linkedin/Burrow .
It connects to the UPP Kafka and Zookeeper services and provides a RESTful API for the "kafka-lagcheck" service to check Kafka consumer offsets.
One can also use Burrow to check Kafka consumer and topic info, and delete consumer groups from Kafka.

## Contains Personal Data

No

## Contains Sensitive Data

No

## Dependencies

- upp-kafka
- upp-zookeeper

## Failover Architecture Type

ActiveActive

## Failover Process Type

FullyAutomated

## Failback Process Type

FullyAutomated

## Failover Details

The service is deployed in both Publishing and Delivery clusters.

The failover guide for the Delivery clusters is located here:
https://github.com/Financial-Times/upp-docs/tree/master/failover-guides/delivery-cluster

The failover guide for the Publishing clusters is located here:
https://github.com/Financial-Times/upp-docs/tree/master/failover-guides/publishing-cluster

## Data Recovery Process Type

NotApplicable

## Data Recovery Details

The service does not store data, so it does not require any data recovery steps.

## Release Process Type

PartiallyAutomated

## Rollback Process Type

Manual

## Release Details

It is safe to release the service without failover.

## Key Management Process Type

Manual

## Key Management Details

To access the service clients need to provide basic auth credentials.
To rotate credentials you need to login to a particular cluster and update varnish-auth secrets.

## Monitoring

Burrow doesn't have monitoring of its own but one can check the health of "kafka-lagcheck" which depends on it, e.g.:

- Publishing EU Kafka lagcheck health: https://upp-prod-publish-eu.upp.ft.com/__health/__pods-health?service-name=kafka-lagcheck
- Publishing US Kafka lagcheck health: https://upp-prod-publish-us.upp.ft.com/__health/__pods-health?service-name=kafka-lagcheck
- Delivery EU Kafka lagcheck health: https://upp-prod-delivery-eu.upp.ft.com/__health/__pods-health?service-name=kafka-lagcheck
- Delivery US Kafka lagcheck health: https://upp-prod-delivery-us.upp.ft.com/__health/__pods-health?service-name=kafka-lagcheck

## First Line Troubleshooting

https://github.com/Financial-Times/upp-docs/tree/master/guides/ops/first-line-troubleshooting

## Second Line Troubleshooting

Please refer to the GitHub repository README for troubleshooting information.

Additionally you can check the official Burrow wiki page: https://github.com/linkedin/Burrow/wiki

