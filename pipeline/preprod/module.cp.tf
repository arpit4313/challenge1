module "capacity_provider" {
  source                 = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_ecs_capacity_provider?ref=main"
  name                   = "${var.name}-${var.environment}"
  auto_scaling_group_arn = module.asg.asg_arn
  target_capacity        = "100"
  minimum_scaling_step_size = 10
  maximum_scaling_step_size = 100
}