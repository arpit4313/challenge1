####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
########### ECS Cluster ############
resource "aws_ecs_cluster" "ecs_cluster" {
  name               = var.name
  capacity_providers = var.capacity_providers_name
  default_capacity_provider_strategy {
    capacity_provider = var.capacity_provider
    weight            = var.weight
    base              = var.base
  }
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  tags = merge(
    var.common_tags,
    map("Classification", "private"),
    map("Name", var.environment)
  )
}