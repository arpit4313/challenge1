module "albsg" {
  source = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_security_group?ref=main"
  name   = "${var.name}-${var.environment}-lb"
  tags   = var.tags
  Created_using = "TF"
  vpc_id = module.vpc.vpc_id
}
module "sg_ingress_link4" {
  source            = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_security_group_ingress?ref=main"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow SSL"
  ports             = [443, 80 ]
  protocol          = "TCP"
  security_group_id = module.albsg.sg_id
  tags              = var.tags
}
module "sg_egress2" {
  source            = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_security_group_egress?ref=main"
  security_group_id = module.albsg.sg_id
}
