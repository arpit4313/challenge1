module "rds_instance" {
  source                              = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//rds_instance?ref=main"
  identifier                          = "${var.name}-${var.environment}-rds"
  engine                              = "mysql"
  engine_version                      = "5.7"
  instance_class                      = "db.t2.medium"
  allocated_storage                   = "98"
  storage_type                        = "gp2"
  storage_encrypted                   = true
  kms_key_id                          = module.kms_data_rds.kms_key_alias_arn
  db_subnet_group_name                = module.rds_subnet_group.rds_subnet_group_name
  name                                = "zee5b2b-adminpanelapi"
  username                            = "staguactionuid"
  password                            = module.sm_version.password
  port                                = "3306"
  vpc_security_group_ids              = [module.sg.sg_id]
  parameter_group_name                = module.rds_parameter_group.rds_db_parameter_group_name
  multi_az                            = true
  copy_tags_to_snapshot               = false
  backup_retention_period             = "7"
  license_model                       = "general-public-license"
  iam_database_authentication_enabled = false
  publicly_accessible                 = false
  allow_major_version_upgrade         = false
  auto_minor_version_upgrade          = true
  apply_immediately                   = false
  deletion_protection                 = false
  performance_insights_enabled        = true
  performance_insights_kms_key_id     = module.kms_data_rds.kms_key_alias_arn
  iops                                = "0"
#  snapshot_identifier                 = "b2b-adminpanelapi-preprod-2-zee5-latest-snp"
  skip_final_snapshot                 = false
  final_snapshot_identifier           = "${var.name}-${var.environment}-rds-snapshot"
}
module "rds_parameter_group" {
  source = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//rds_parameter_group?ref=main"
  name   = var.name
  family = "mysql5.6"
}

module "rds_subnet_group" {
  source      = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//rds_subnet_group?ref=main"
  name        = var.name
  description = "This RDS is used for Zee5 new b2b-adminpanel API partner application for preprod environment"
  subnet_ids  = [module.vpc.subnet_data_az1_id, module.vpc.subnet_data_az2_id, module.vpc.subnet_data_az3_id]
}