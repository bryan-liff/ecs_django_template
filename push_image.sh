#!/bin/bash

export AWS_PROFILE=does
aws ecr get-login-password | docker login --username AWS --password-stdin [ECR_ID].dkr.ecr.us-east-1.amazonaws.com/does

docker tag does_app:deploy [ECR_ID].dkr.ecr.us-east-1.amazonaws.com/app:latest
docker push [ECR_ID].dkr.ecr.us-east-1.amazonaws.com/app:latest

docker tag does_nginx:deploy [ECR_ID].dkr.ecr.us-east-1.amazonaws.com/nginx:latest
docker push [ECR_ID].dkr.ecr.us-east-1.amazonaws.com/nginx:latest
