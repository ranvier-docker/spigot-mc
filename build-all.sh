#!/bin/bash

#docker build --build-arg VERSION=1.14.4 -t ranvier/spigot-mc:1.14.4 .
docker build --build-arg VERSION=1.15.2 -t ranvier/spigot-mc:1.15.2 .
docker build --build-arg VERSION=1.16.1 -t ranvier/spigot-mc:1.16.1 .
docker build --build-arg VERSION=latest -t ranvier/spigot-mc:latest .

exit 0
