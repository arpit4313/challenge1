module "cw" {
  source      = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_cloudwatch_log_group?ref=main"
  environment = var.environment
  name        = "/aws/ecs/${var.name}-${var.environment}"
}