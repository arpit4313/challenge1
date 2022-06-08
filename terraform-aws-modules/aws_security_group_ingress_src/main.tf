####################################################################
#### Created by : Kalyan Chakravarthi/ Kalyan Bhave ####
#### Date : 20-Nov-2019 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_security_group_rule" "sg_src" {
  type              = "ingress"
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  description       = var.description
  security_group_id = var.security_group_id
  source_security_group_id = var.source_security_group_id
}