#!/bin/bash

#AWS CREDENTIALS
export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2
export AWS_DEFAULT_REGION=$3

#Adding path for AWS CLI and AWS IAM Authenticator - kubectl will call them
export PATH=/usr/local/bin:$PATH

#Config Kubectl
/usr/local/bin/aws eks --region $3 update-kubeconfig --name $6
export KUBECONFIG=/var/lib/jenkins/.kube/config

#Deploy EKS application
cd deploy
export ECR_IMAGE=$4:v$5
envsubst < aws_app_deployment.yml | /usr/local/bin/kubectl apply -f -
/usr/local/bin/kubectl apply -f loadbalancer_aws_app.yml


