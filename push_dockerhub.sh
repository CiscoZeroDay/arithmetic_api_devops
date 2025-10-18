#!/usr/bin/env bash
set -e

DOCKER_USER="razafindraibe"
IMAGE="arith-api"

docker build -t $IMAGE .
docker tag $IMAGE $DOCKER_USER/$IMAGE:latest

echo "Login to Docker Hub..."
docker login -u $DOCKER_USER

docker push $DOCKER_USER/$IMAGE:latest
