#!/bin/bash
#
# Usage: ./force_redeploy_ecs.sh [NAME_OF_ECS_SERVICE]

export AWS_PROFILE=does

aws ecs update-service --cluster web --service $1 --force-new-deployment --region us-east-1
