resource "aws_subnet" "subnet_public" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["public"], count.index)
  availability_zone = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-sub-${var.sub_services_names["public"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Description", "This subnet is too host, IGW, NATGW and ALBs with public ip only"),
  var.common_tags,
  map("Classification", "public")
  )
}

resource "aws_subnet" "subnet_private_shared" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["private_shared"], count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-sub-${var.sub_services_names["private_shared"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Description", "This subnet is for Endpoints and Internal ALB only like S3 endpoint"),
  var.common_tags,
  map("Classification", "private")
  )
}
/*
resource "aws_subnet" "subnet_private_redis" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["private_redis"], count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-sub-${var.sub_services_names["private_redis"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Description", "This subnet is only for Redis clusters"),
  var.common_tags,
  map("Classification", "private")
  )
}
*/
resource "aws_subnet" "subnet_private_db" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["private_db"], count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-sub-${var.sub_services_names["private_db"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Description", "This subnet is only for RDS"),
  var.common_tags,
  map("Classification", "private")
  )
}
resource "aws_subnet" "subnet_private_compute" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["private_compute"], count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-sub-${var.sub_services_names["private_compute"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Description", "This subnet is for all Compute resources like EC2, ECS, EMR etc"),
  var.common_tags,
  map("Classification", "private")
  )
}
/*
resource "aws_subnet" "subnet_private_country" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["private_country"], count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-sub-${var.sub_services_names["private_country"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Description", "This subnet is for all country API"),
  var.common_tags,
  map("Classification", "private")
  )
}
resource "aws_subnet" "subnet_private_launch" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["private_launch"], count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-sub-${var.sub_services_names["private_launch"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Description", "This subnet is for all launch API"),
  var.common_tags,
  map("Classification", "private")
  )
}
resource "aws_subnet" "subnet_private_content" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["private_content"], count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-sub-${var.sub_services_names["private_content"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Description", "This subnet is for all content API"),
  var.common_tags,
  map("Classification", "private")
  )
}
resource "aws_subnet" "subnet_private_singleplayback" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["private_singleplayback"], count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-sub-${var.sub_services_names["private_singleplayback"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Description", "This subnet is for all singleplayback API"),
  var.common_tags,
  map("Classification", "private")
  )
}
resource "aws_subnet" "subnet_private_solr" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["private_solr"], count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-sub-${var.sub_services_names["private_solr"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Description", "This subnet is for all solr instances"),
  var.common_tags,
  map("Classification", "private")
  )
}
*/
resource "aws_subnet" "subnet_private_lambda" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["private_lambda"], count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-sub-${var.sub_services_names["private_lambda"]}-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Description", "This subnet is for all lambda instances"),
  var.common_tags,
  map("Classification", "private")
  )
}