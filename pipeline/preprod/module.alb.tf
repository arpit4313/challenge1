module "vpc" {
  source = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_vpc?ref=main"
  vpc_id = var.vpc_id
}

module "alb" {
  source          = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_lb_application?ref=main"
  environment     = var.environment
  lb_internal     = "false"
  name            = "${var.name}-${var.environment}"
  security_groups = [module.albsg.sg_id]
  subnets         = [module.vpc.subnet_pub_az1_id, module.vpc.subnet_pub_az2_id, module.vpc.subnet_pub_az3_id]
  Created_using = "TF"
}
module "alb_listner_443" {
  source           = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_lb_application_listner?ref=main"
  alb_arn          = module.alb.alb_arn
  alb_lb_port      = "443"
  cert_arn         = "arn:aws:acm:ap-south-1:997200155612:certificate/4a888cf8-d785-458c-a426-0e1cca3eec3d"
  protocol         = "HTTPS"
  ssl_policy       = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
  target_group_arn = module.alb_target_group.alb_target_group_arn
}
module "alb_listner_redirect" {
  source               = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_lb_application_listner_redirect?ref=main"
  port                 = "80"
  protocol             = "HTTP"
  redirect_port        = "443"
  redirect_protocol    = "HTTPS"
  redirect_status_code = "HTTP_301"
  alb_arn              = module.alb.alb_arn
}
module "alb_target_group" {
  source          = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_lb_application_target?ref=main"
  environment     = var.environment
  health_path     = "/healthcheck?test=1"
  health_port     = "traffic-port"
  health_protocol = "HTTP"
  name            = "${var.name}-${var.environment}"
  protocol        = "HTTP"
  tg_port         = "80"
  vpc_id          = module.vpc.vpc_id
  target_type = var.target_type
  matcher     = "200"
}