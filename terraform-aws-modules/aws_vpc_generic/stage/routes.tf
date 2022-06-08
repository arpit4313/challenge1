resource "aws_default_route_table" "public" {
  default_route_table_id = aws_vpc.core_vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.core_igw.id
  }
  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-rtb-${var.sub_services_names["public"]}-all"),
  map("VPC", aws_vpc.core_vpc.id),
  var.common_tags,
  map("Classification", "public")
  )
}

resource "aws_route_table" "private_shared" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.core_vpc.id
  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-rtb-${var.sub_services_names["private_shared"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  var.common_tags,
  map("Classification", "private")
  )
}
/*
resource "aws_route_table" "private_redis" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.core_vpc.id
  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-rtb-${var.sub_services_names["private_redis"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  var.common_tags,
  map("Classification", "private")
  )
}*/ 
resource "aws_route_table" "private_db" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.core_vpc.id
  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-rtb-${var.sub_services_names["private_db"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  var.common_tags,
  map("Classification", "private")
  )
}
resource "aws_route_table" "private_compute" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.core_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.core_nat.*.id, count.index)
  }
 # route {
 #   cidr_block                = var.vpc_peering_cidr
 #   vpc_peering_connection_id = data.aws_vpc_peering_connection.pc.id
 # }
  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-rtb-${var.sub_services_names["private_compute"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  var.common_tags,
  map("Classification", "private")
  )
}
/*
resource "aws_route_table" "private_country" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.core_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.core_nat.*.id, count.index)
  }
  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-rtb-${var.sub_services_names["private_country"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  var.common_tags,
  map("Classification", "private")
  )
}
resource "aws_route_table" "private_launch" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.core_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.core_nat.*.id, count.index)
  }
  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-rtb-${var.sub_services_names["private_launch"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  var.common_tags,
  map("Classification", "private")
  )
}
resource "aws_route_table" "private_content" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.core_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.core_nat.*.id, count.index)
  }
  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-rtb-${var.sub_services_names["private_content"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  var.common_tags,
  map("Classification", "private")
  )
}
resource "aws_route_table" "private_singleplayback" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.core_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.core_nat.*.id, count.index)
  }
  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-rtb-${var.sub_services_names["private_singleplayback"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  var.common_tags,
  map("Classification", "private")
  )
}
resource "aws_route_table" "private_solr" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.core_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.core_nat.*.id, count.index)
  }
  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-rtb-${var.sub_services_names["private_solr"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  var.common_tags,
  map("Classification", "private")
  )
}
*/
resource "aws_route_table" "private_lambda" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.core_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.core_nat.*.id, count.index)
  }
  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-rtb-${var.sub_services_names["private_lambda"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  var.common_tags,
  map("Classification", "private")
  )
}
resource "aws_route_table_association" "shared" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.subnet_private_shared.*.id, count.index)
  route_table_id = element(aws_route_table.private_shared.*.id, count.index)
}

resource "aws_route_table_association" "db" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.subnet_private_db.*.id, count.index)
  route_table_id = element(aws_route_table.private_db.*.id, count.index)
}
/* 
resource "aws_route_table_association" "redis" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.subnet_private_redis.*.id, count.index)
  route_table_id = element(aws_route_table.private_redis.*.id, count.index)
}
*/
resource "aws_route_table_association" "public" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.subnet_public.*.id, count.index)
  route_table_id = element(aws_default_route_table.public.*.id, count.index)
}
resource "aws_route_table_association" "compute" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.subnet_private_compute.*.id, count.index)
  route_table_id = element(aws_route_table.private_compute.*.id, count.index)
}
/*
resource "aws_route_table_association" "country" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.subnet_private_country.*.id, count.index)
  route_table_id = element(aws_route_table.private_country.*.id, count.index)
}
resource "aws_route_table_association" "launch" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.subnet_private_launch.*.id, count.index)
  route_table_id = element(aws_route_table.private_launch.*.id, count.index)
}
resource "aws_route_table_association" "content" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.subnet_private_content.*.id, count.index)
  route_table_id = element(aws_route_table.private_content.*.id, count.index)
}
resource "aws_route_table_association" "singleplayback" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.subnet_private_singleplayback.*.id, count.index)
  route_table_id = element(aws_route_table.private_singleplayback.*.id, count.index)
}
resource "aws_route_table_association" "solr" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.subnet_private_solr.*.id, count.index)
  route_table_id = element(aws_route_table.private_solr.*.id, count.index)
}
*/
resource "aws_route_table_association" "lambda" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.subnet_private_lambda.*.id, count.index)
  route_table_id = element(aws_route_table.private_lambda.*.id, count.index)
}
########################### vpc peering #########################################
# data "aws_vpc_peering_connection" "pc" {
#  filter {
#    name   = "tag:Name"
#    values = ["prod-infra-peering"]
#  }
# }

