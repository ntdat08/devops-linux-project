#!/bin/bash

APP_NAME="devops_app"
PORT=9090

echo "===== STOP OLD CONTAINER ====="
docker stop $APP_NAME 2>/dev/null
docker rm $APP_NAME 2>/dev/null

echo "===== BUILD DOCKER IMAGE ====="
docker build -t $APP_NAME .

echo "===== RUN CONTAINER ====="
docker run -d -p $PORT:80 --name $APP_NAME $APP_NAME

echo "===== DEPLOY SUCCESS ====="
echo "Access: http://localhost:$PORT"
