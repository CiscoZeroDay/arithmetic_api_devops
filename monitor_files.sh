#!/usr/bin/env bash
set -e

echo "Watching for changes..."
while true; do
  inotifywait -e modify,create,delete -r ./*.py Dockerfile requirements.txt >/dev/null 2>&1
  echo "Change detected! Redeploying..."
  ./deploy.sh
done
