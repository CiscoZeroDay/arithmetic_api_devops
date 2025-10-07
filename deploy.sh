#!/usr/bin/env bash

set -e

docker build -t arith-api .
docker stop arith-api-container 2>/dev/null || true
docker rm arith-api-container 2>/dev/null || true
docker run -d -p 8080:8080 --name arith-api-container arith-api