#!/bin/bash
DOCKER_COMPOSE_VERSION=`git ls-remote --tags git://github.com/docker/compose.git | awk '{print $2}' |grep -v "docs\|rc" |awk -F'/' '{print $3}' |sort -V |tail -n1`
mkdir -p /opt/bin
curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /opt/bin/docker-compose
chmod +x /opt/bin/docker-compose
