module "kms_data_sm" {
  source        = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_kms_key_data?ref=main"
  kms_key_alias = "zee5-nprd-sm"
}
module "kms_data_rds" {
  source        = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_kms_key_data?ref=main"
  kms_key_alias = "zee5-nprd-rds"
}