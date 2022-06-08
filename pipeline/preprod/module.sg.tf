module "sg" {
  source = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_security_group?ref=main"
  name   = "${var.name}-${var.environment}"
  tags   = var.tags
  Created_using = "TF"
  vpc_id = module.vpc.vpc_id
}
module "sg_ingress_link1" {
  source            = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_security_group_ingress?ref=main"
  cidr_blocks       = ["10.33.82.0/23"]
  description       = "Allow SSL"
  ports             = [443, 80, 7000, 8080, 2086]
  protocol          = "TCP"
  security_group_id = module.sg.sg_id
  tags              = var.tags
}
module "sg_ingress_link2" {
  source            = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_security_group_ingress?ref=main"
  cidr_blocks       = ["10.33.84.0/23"]
  description       = "Allow SSL"
  ports             = [443, 80, 7000, 8080, 2086]
  protocol          = "TCP"
  security_group_id = module.sg.sg_id
  tags              = var.tags
}
module "sg_ingress_office5" {
  source            = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_security_group_ingress_src?ref=develop"
  source_security_group_id       = module.albsg.sg_id
  description       = "Allow all from Office3"
  from_port         = "0"
  protocol          = "TCP"
  security_group_id = module.sg.sg_id
  to_port           = "65535"
}
module "sg_ingress_vpc" {
  source            = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_security_group_ingress_vpc?ref=main"
  cidr_blocks       = [module.vpc.vpc_id_cidr]
  description       = "Allow all from VPC"
  from_port         = "0"
  protocol          = "TCP"
  security_group_id = module.sg.sg_id
  to_port           = "65535"
}
module "sg_egress" {
  source            = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//aws_security_group_egress?ref=main"
  security_group_id = module.sg.sg_id
}