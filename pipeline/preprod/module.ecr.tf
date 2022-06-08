module "ecr" {
  source      = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_ecr_repository?ref=main"
  environment = var.environment
  name        = "${var.name}-${var.environment}"
  common_tags = var.tags
}
module "image" {
  source              = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_ecr_image?ref=main"
  image_name          = "${var.name}-${var.environment}"
  repository_url      = "${var.account_id}.dkr.ecr.ap-south-1.amazonaws.com/${var.name}-${var.environment}"
  source_path         = "${path.module}/../b2b-adminpanel"
  tag                 = "latest"
  ecs_cluster_name    = module.ecs_cluster.aws_ecs_cluster_name
  ecs_service_name    = module.ecs_ec2_service.aws_ecs_service_name
  ecs_task_definition = module.ecs_ec2_task_definition.aws_ecs_task_definition
  account_id          = var.account_id
}