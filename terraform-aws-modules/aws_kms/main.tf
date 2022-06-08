####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
########### To create KMS ###########
resource "aws_kms_key" "kms_key" {
  description             = "Zee5 Customer Managed KMS key"
  is_enabled              = var.is_enabled
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  policy                  = var.policy
  tags = {
    Key_Enabled  = var.is_enabled
    Key_Validity = var.deletion_window_in_days
    Created_using = var.Created_using
  }
}

resource "aws_kms_alias" "kms_key_alias" {
  name          = "alias/${var.key_alias}"
  target_key_id = aws_kms_key.kms_key.id
}
