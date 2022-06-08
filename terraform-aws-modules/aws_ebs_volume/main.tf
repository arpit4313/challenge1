####################################################################
#### Created by : Balakrishna/ Praveen kumar ####
####################################################################
resource "aws_ebs_volume" "volume" {
  availability_zone = var.availability_zone
  size              = var.size
  type              = var.type
  kms_key_id        = var.kms_key_id
  iops              = var.iops

  tags = {
    Name       = var.name
    Created_by = var.Created_by
    Environment = var.environment
  }
}