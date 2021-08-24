#!/bin/sh

# setting up a docker volume using -v
# remember that we set the working dir to /app in Dockerfile.dev
docker run -it -p 3000:3000 -v /app/node_modules  -v $PWD:/app $(docker images -q | head -n 1)
# what does the -v/app/node_modules do? It states to docker:
# Use the /app/node_modules directory that is inside of the Docker image rather than doing any kind of mapping


#docker run -it -p 3000:3000 "$1" #$(docker images -q | head -n 1)
