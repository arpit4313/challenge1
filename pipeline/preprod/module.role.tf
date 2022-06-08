module "role_ecs" {
  source             = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_iam_role?ref=main"
  account_id         = var.account_id
  name               = "${var.name}-${var.environment}-ecsTaskExecutionRole"
  custom_policy      = "ecsTaskExecution_policy"
  trust_relationship = "trust_relationship"
}
module "role_ecs_attach_policy" {
  source     = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_iam_role_policy_attachment?ref=main"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
  role       = module.role_ecs.role_name
}
