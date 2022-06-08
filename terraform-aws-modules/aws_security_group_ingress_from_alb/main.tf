####################################################################
#### Created by : Sanjib Mandal ####
#### Date : 22-Mar-2021 ####
####################################################################
resource "aws_security_group_rule" "sgr" {
  count             = length(var.ports)
  type              = "ingress"
  from_port         = element(var.ports, count.index)
  to_port           = element(var.ports, count.index)
  protocol          = var.protocol
  #cidr_blocks       = var.cidr_blocks
  description       = var.description
  security_group_id = var.security_group_id
  #self              = var.self
}
##