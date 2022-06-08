####################################################################
#### Created by : Kalyan Chakravarthi/ Kalyan Bhave ####
#### Date : 20-Nov-2019 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
# Egress - Allow All
#
resource "aws_security_group_rule" "sgre" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = var.security_group_id
}