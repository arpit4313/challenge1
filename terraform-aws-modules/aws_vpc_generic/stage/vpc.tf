resource "aws_vpc" "core_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}"),
  var.common_tags,
  map("Classification", "private")
  )
}

resource "aws_cloudwatch_log_group" "vpc_flowlogs_log_group" {
  name              = "${var.vpc_name}-${var.environment}-${var.vpc_flow_log_group_name}"
  retention_in_days = 90
}

resource "aws_flow_log" "vpc_flow_logs" {
  log_destination = aws_cloudwatch_log_group.vpc_flowlogs_log_group.arn
  iam_role_arn    = "arn:aws:iam::${var.account_id}:role/vpc_flowlog_role"
  vpc_id          = aws_vpc.core_vpc.id
  traffic_type    = "ALL"
}

resource "aws_default_network_acl" "nacl" {
  default_network_acl_id = aws_vpc.core_vpc.default_network_acl_id
  subnet_ids = concat(
  aws_subnet.subnet_public.*.id,
#  aws_subnet.subnet_private_redis.*.id,
  aws_subnet.subnet_private_db.*.id,
  aws_subnet.subnet_private_compute.*.id,
  aws_subnet.subnet_private_shared.*.id,
#  aws_subnet.subnet_private_country.*.id,
#  aws_subnet.subnet_private_launch.*.id,
#  aws_subnet.subnet_private_content.*.id,
#  aws_subnet.subnet_private_singleplayback.*.id,
#  aws_subnet.subnet_private_solr.*.id,
  aws_subnet.subnet_private_lambda.*.id
  )

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-nacl"),
  map("VPC", "${aws_vpc.core_vpc.id}"),
  var.common_tags,
  map("Classification", "private")
  )
}