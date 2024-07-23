# Zscaler Docker

This provides the flexibility to run Zscaler's client connector from a Docker container and without the need to conform to any specific device posture profiles.

## Usage
```
// Download pre-built Docker image
docker pull sverunna/zscaler-docker:latest

// Run container. The net flag is required by zscaler
docker run --name "zscaler-tesla" -p 9002:9002 -v /:/= --net=host zscaler-docker

// To run in background, add --detach flag
```

## Authentication
Once the container is up and running, the user is able to authenticate via https://localhost:9002. Once authenticated the connector will establish an encrypted tunnel to the Zscaler cloud.