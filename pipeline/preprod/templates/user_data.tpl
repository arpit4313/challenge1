#!/bin/bash
echo ECS_CLUSTER=preprod >> /etc/ecs/ecs.config
cat /etc/ecs/ecs.config | grep "ECS_CLUSTER"