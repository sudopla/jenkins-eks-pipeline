#!/bin/bash

echo "Creating container image"
cd build/container
docker build -t $1:v$2 .
