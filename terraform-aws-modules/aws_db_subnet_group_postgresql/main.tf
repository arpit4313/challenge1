####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_db_subnet_group" "postgresql" {
  name        = var.name
  description = var.description
  subnet_ids  = var.subnet_ids
}
