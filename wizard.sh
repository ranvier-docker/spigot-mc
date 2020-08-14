#!/bin/bash

ACTION=$1
SAVE_DIR='./build/'

build(){
  docker build --build-arg VERSION=1.16.2 -t ranvier/spigot-mc:1.16.1 .
  docker build --build-arg VERSION=latest -t ranvier/spigot-mc:latest .
}

save(){
  mkdir $SAVE_DIR
  docker image save ranvier/spigot-mc:1.16.1 > $SAVE_DIR/spigot-mc-1.16.1.tar
  docker image save ranvier/spigot-mc:latest > $SAVE_DIR/spigot-mc-latest.tar
}

if [[ "$ACTION" == 'build' ]]; then
  build
elif [[ "$ACTION" == 'save' ]]; then
  save
else
  build && save
fi

exit 0
