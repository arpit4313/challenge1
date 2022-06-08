####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
data "aws_kms_key" "kms" {
  key_id = "alias/${var.kms_key_alias}"
}