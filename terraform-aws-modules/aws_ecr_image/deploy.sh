#!/usr/bin/env bash
set -e

source_path="$1"
repository_url="$2"
tag="$3"
ecs_cluster_name="$4"
ecs_service_name="$5"
ecs_task_definition="$6"
account_id="$7"
role_name="$8"
echo "-------------------- Started $ecs_service_name --------------------"
region="$(echo "$repository_url" | cut -d. -f4)"
image_name="$(echo "$repository_url" | cut -d/ -f2)"
(cd "$source_path" && docker build -t "$image_name" .)
aws sts assume-role --role-arn "arn:aws:iam::$account_id:role/$role_name" --role-session-name "docker-connect" > assume-role-output.txt
export IAM_INSTANCE_PROFILE="$role_name"
export AWS_ACCESS_KEY_ID=`cat assume-role-output.txt | jq -c '.Credentials.AccessKeyId' | tr -d '"' | tr -d ' '`
export AWS_SECRET_ACCESS_KEY=`cat assume-role-output.txt | jq -c '.Credentials.SecretAccessKey' | tr -d '"' | tr -d ' '`
export AWS_SESSION_TOKEN=`cat assume-role-output.txt | jq -c '.Credentials.SessionToken' | tr -d '"' | tr -d ' '`
aws sts get-caller-identity
aws ecr get-login --no-include-email --region "$region" | bash
docker tag "$image_name" "$repository_url":"$tag"
docker push "$repository_url":"$tag"
rm -f assume-role-output.txt
aws ecs update-service --cluster "$ecs_cluster_name" --region "$region" --service "$ecs_service_name" --task-definition  "$ecs_task_definition" --force-new-deployment
echo "-------------------- Completed $ecs_service_name --------------------"