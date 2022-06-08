module "asg" {
  source                    = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_autoscaling_group_spot_v2?ref=test"
  account_id                = var.account_id
  asg_desired_capacity      = "1"
  asg_max_size              = "3"
  asg_min_size              = "1"
  environment               = var.environment
  health_check_grace_period = "0"
  default_cooldown          = "0"
  key_name                  = "-stg-api"
  name                      = "${var.name}-${var.environment}"
  security_group            = [module.sg.sg_id]
  vpc_id                    = module.vpc.vpc_id
  vpc_zone_identifier = module.vpc.subnet_pri_ids
  launch_template_id      = module.lt.aws_lt_id
  weighted_capacity       = "1"
  on_demand_base_capacity = 3
  tag = [
    {
      key                 = "created_using"
      propagate_at_launch = "true"
      value               = "TF"
    }
  ]
}
module "lt" {
  source                     = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_launch_template_spot?ref=main"
  image_id                   = "ami-0cd2ebd86e9e44cec"
  account_id                 = var.account_id
  instance_type              = "t2.large"
  key_name                   = "-stg-api"
  name                       = "${var.name}-${var.environment}-lt"
  security_group             = [module.sg.sg_id]
  user_data                  = "user_data"
  instance_profile_role_name = module.role_ecs.instance_profile_name
  resource_type = "instance"
  Created_using = "TF"
}