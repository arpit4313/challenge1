####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_rds_cluster_instance" "aurora_rds_instance" {
  cluster_identifier           = var.cluster_identifier
  identifier                   = var.identifier
  engine                       = var.engine
  engine_version               = var.engine_version
  instance_class               = var.instance_class
  db_subnet_group_name         = var.db_subnet_group_name
  performance_insights_enabled = var.performance_insights_enabled
  db_parameter_group_name      = var.db_parameter_group_name
  apply_immediately            = var.apply_immediately
  tags = {
    Name        = var.name
    Environment = terraform.workspace
  }
}


