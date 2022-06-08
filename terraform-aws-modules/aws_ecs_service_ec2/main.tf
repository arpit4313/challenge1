####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
############ ECS EC2 Service ##############
resource "aws_ecs_service" "ecs_service" {
  name                 = "${var.name}-ecs-service"
  cluster              = var.cluster_id
  task_definition      = var.task_definition_arn
  desired_count        = var.desired_count
  iam_role             = var.ecs_iam_role
  force_new_deployment = var.force_new_deployment
  #  launch_type                       = "EC2"
  health_check_grace_period_seconds = "600"
  deployment_controller {
    type = "ECS"
  }
  deployment_maximum_percent         = "200"
  deployment_minimum_healthy_percent = "100"
  load_balancer {
    target_group_arn = var.lb_tg_arn
    container_name   = var.name
    container_port   = var.port
  }
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  ordered_placement_strategy {
    type  = "spread"
    field = "attribute:ecs.availability-zone"
  }
  tags = {
    Environment         = var.environment
    app-name            = var.app-name
    team-name           = var.team-name
    created-by          = var.created-by
    ticket              = var.ticket
    cost-center         = var.cost-center
    contact-email       = var.contact-email
    created-date        = var.created-date
    resource-function   = var.resource-function
    patch-exempt        = var.patch-exempt
    data-classification = var.data-classification
  }
  capacity_provider_strategy {
    capacity_provider = var.capacity_provider
    weight            = var.weight
    base              = 1
  }
  lifecycle {
    ignore_changes = [desired_count]
  }
  depends_on = [var.aws_alb]
}
