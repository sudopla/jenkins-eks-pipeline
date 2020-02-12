#!/bin/bash

#AWS CREDENTIALS
export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2
export AWS_DEFAULT_REGION=$3

/usr/local/bin/aws ecr get-login-password | docker login --username AWS --password-stdin $4

docker push $4:v$5 


