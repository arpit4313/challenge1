module "ecs_cluster" {
  source                  = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_ecs_cluster_ec2?ref=main"
  environment             = var.environment
  name                    = "${var.name}-${var.environment}"
  common_tags             = var.tags
  capacity_providers_name = [module.capacity_provider.capacity_provider_name]
  capacity_provider       = module.capacity_provider.capacity_provider_name
  weight                  = "1"
  base                    = "1"
}
module "ecs_ec2_service" {
  source              = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_ecs_service_ec2?ref=main"
  aws_alb             = module.alb.alb_arn_dns_name
  cluster_id          = module.ecs_cluster.aws_ecs_cluster
  common_tags         = var.tags
  desired_count       = 3
  environment         = var.environment
  lb_tg_arn           = module.alb_target_group.alb_target_group_arn
  name                = "${var.name}-${var.environment}"
  port                = 7000
  task_definition_arn = module.ecs_ec2_task_definition.aws_ecs_task_definition
  capacity_provider   = module.capacity_provider.capacity_provider_name
  weight              = "1"
}
module "ecs_ec2_task_definition" {
  source                    = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_ecs_task_definition_ec2?ref=main"
  account_id                = var.account_id
  common_tags               = var.tags
  environment               = var.environment
  execution_role_arn        = module.role_ecs.role_arn
  family                    = "${var.name}-${var.environment}"
  name                      = "${var.name}-${var.environment}"
  hostPort                  = 0
  containerPort             = 7000
  region                    = var.region
  task-definition-file-name = "task-definitions-service"
  instana_agent_key         = var.instana_agent_key
  instana_agent_url         = var.instana_agent_url
  instana_timeout           = var.instana_timeout
  task_role_arn             = module.role_ecs.role_arn
  network_mode              = "bridge"
  ecs_taskdefinition_cpu    = "1024"
  ecs_taskdefinition_memory = "4096"
}

module "ecs_scale" {
  source                 = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_appautoscaling_target?ref=main"
  ecs_cluster_name       = module.ecs_cluster.aws_ecs_cluster_name
  ecs_service_name       = module.ecs_ec2_service.aws_ecs_service_name
  name                   = "appscaling-${var.name}-${var.environment}"
  disable_scale_in       = false
  predefined_metric_type = "ECSServiceAverageCPUUtilization"
  scale_in_cooldown      = "0"
  scale_out_cooldown     = "150"
  target_value           = "50"
  min_count              = "4"
  max_count              = "10"
}
