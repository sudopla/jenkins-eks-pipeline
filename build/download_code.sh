#!/bin/bash

#Relative Path to container when the script is executed from JenkinsFile
CONTAINER_PATH=build/container

#CodeCommit URL with username and password
URL=https://$1:$2@$3
echo $URL

if [[ ! -d $CONTAINER_PATH/app_code ]]
then
   echo "Create clone of CodeCommit repository"
   git clone $URL $CONTAINER_PATH/app_code
else
   echo "Pull latest changes on CodeCommit repository"
   cd $CONTAINER_PATH/app_code
   git pull $URL master
fi

