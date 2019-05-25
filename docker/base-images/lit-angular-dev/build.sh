#!/bin/bash

# DOCKER HUB Registry
##-------------------------------
VERSION=0.0.3
docker build -t breitsmiley/lit-angular-dev:latest -t breitsmiley/lit-angular-dev:${VERSION} . \
&& docker push breitsmiley/lit-angular-dev:latest \
&& docker push breitsmiley/lit-angular-dev:${VERSION}
