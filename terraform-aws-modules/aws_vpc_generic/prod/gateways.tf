resource "aws_internet_gateway" "core_igw" {
  vpc_id = aws_vpc.core_vpc.id

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-igw-all"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Classification", "public"),
  var.common_tags
  )
}

resource "aws_eip" "nat_eip" {
  count = length(var.availability_zones)
  vpc   = true
  depends_on = [aws_internet_gateway.core_igw]

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-eip-nat-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Classification", "public"),
  var.common_tags
  )
}
resource "aws_nat_gateway" "core_nat" {
  count         = length(var.availability_zones)
  allocation_id = aws_eip.nat_eip.*.id[count.index]
  subnet_id     = aws_subnet.subnet_public.*.id[count.index]
  depends_on    = [aws_internet_gateway.core_igw]

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-nat-az${count.index + 1}"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  map("Classification", "private"),
  var.common_tags
  )
}
