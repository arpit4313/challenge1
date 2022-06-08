module "sm_secret" {
  source             = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_secretsmanager_secret?ref=main"
  secret_description = "${var.name}-${var.environment}"
  name               = "${var.name}-${var.environment}-rds-pwd"
  kms_key_id         = module.kms_data_sm.kms_key_alias_arn
}
module "sm_version" {
  source    = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_secretsmanager_secret_version?ref=main"
  secret_id = module.sm_secret.secret_id
}