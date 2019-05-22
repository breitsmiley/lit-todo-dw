#!/bin/bash

# DOCKER HUB Registry
##-------------------------------
VERSION=0.0.1
docker build -t breitsmiley/lit-nest-dev:latest -t breitsmiley/lit-nest-dev:${VERSION} . \
&& docker push breitsmiley/lit-nest-dev:latest \
&& docker push breitsmiley/lit-nest-dev:${VERSION}
