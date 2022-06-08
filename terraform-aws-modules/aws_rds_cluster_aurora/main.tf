####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_rds_cluster" "aurora_rds" {
  cluster_identifier        = var.name
  db_subnet_group_name      = var.db_subnet_group_name
  engine                    = var.engine
  engine_version            = var.engine_version
  availability_zones        = var.availability_zones
  storage_encrypted         = var.storage_encrypted
  kms_key_id                = var.kms_key_id
  engine_mode               = var.engine_mode
  master_password           = var.password
  master_username           = var.username
  final_snapshot_identifier = var.final_snapshot_identifier
  vpc_security_group_ids    = var.vpc_security_group_ids
}
