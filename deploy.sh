#!/bin/bash
set -e

APP_NAME="devops_app"
PORT=9090

BUILD_TIME=$(date "+%d/%m/%Y %H:%M:%S")

echo "===== UPDATE BUILD TIME ====="
sed -i "s|<p id=\"build-time\">.*</p>|<p id=\"build-time\"><b>Build time:</b> $BUILD_TIME</p>|" app/index.html

echo "===== STOP OLD CONTAINER ====="
docker stop $APP_NAME 2>/dev/null || true
docker rm $APP_NAME 2>/dev/null || true

echo "===== BUILD DOCKER IMAGE ====="
docker build -t $APP_NAME .

echo "===== RUN CONTAINER ====="
docker run -d -p $PORT:80 --name $APP_NAME $APP_NAME

echo "===== DEPLOY SUCCESS ====="
echo "Access: http://localhost:$PORT"
