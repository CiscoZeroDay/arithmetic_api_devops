#!/bin/bash

REPO_PATH="E:/PROJECT/Devsecops/Lab1/arithmetic"
LAST_COMMIT=$(git -C $REPO_PATH rev-parse HEAD)

while true; do
    git -C $REPO_PATH fetch
    NEW_COMMIT=$(git -C $REPO_PATH rev-parse origin/main)
    if [ "$LAST_COMMIT" != "$NEW_COMMIT" ]; then
        echo "New commit detected. Pulling changes..."
        git -C $REPO_PATH pull
        echo "Rebuilding Docker image..."
        docker build -t simple-api $REPO_PATH
        echo "Redeploying container..."
        docker stop simple-api-container 2>/dev/null
        docker rm simple-api-container 2>/dev/null
        docker run -d --name simple-api-container -p 5000:5000 simple-api
        LAST_COMMIT=$NEW_COMMIT
        echo "Deployment complete."
    fi
    sleep 10
done
