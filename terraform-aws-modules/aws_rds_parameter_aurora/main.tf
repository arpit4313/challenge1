####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_rds_cluster_parameter_group" "aurora" {
  name = var.name
  family = var.family
}