####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_secretsmanager_secret" "secret" {
  description             = var.secret_description
  kms_key_id              = var.kms_key_id
  name                    = var.name
  recovery_window_in_days = 0
}
