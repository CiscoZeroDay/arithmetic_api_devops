#!/bin/bash

FILE_TO_WATCH="app.py"
HASH=$(md5sum $FILE_TO_WATCH)

while true; do
    NEW_HASH=$(md5sum $FILE_TO_WATCH)
    if [ "$HASH" != "$NEW_HASH" ]; then
        echo "Changes detected. Rebuilding Docker image..."
        docker build -t simple-api .
        docker stop simple-api-container 2>/dev/null
        docker rm simple-api-container 2>/dev/null
        docker run -d --name simple-api-container -p 5000:5000 simple-api
        HASH=$NEW_HASH
        echo "Deployment complete."
    fi
    sleep 5
done
