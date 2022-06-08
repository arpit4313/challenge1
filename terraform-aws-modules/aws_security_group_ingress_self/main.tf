resource "aws_security_group_rule" "sgr" {
  type                     = "ingress"
  from_port                = var.from_port
  to_port                  = var.to_port
  protocol                 = var.protocol
  description              = var.description
  security_group_id        = var.security_group_id
  source_security_group_id = var.source_security_group_id
}
