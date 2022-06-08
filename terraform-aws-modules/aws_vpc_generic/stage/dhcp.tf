resource "aws_vpc_dhcp_options" "dhcp_external" {
  domain_name          = var.dhcp_domain_names["external"]
  domain_name_servers  = var.dhcp_name_servers["external"]

  tags = merge(
  map("Name", "${var.vpc_name}-${var.environment}-dhcp"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  var.common_tags,
  map("Classification", "public")
  )
}

# Assign/Associate/link DHCP to VPC
resource "aws_vpc_dhcp_options_association" "dns_resolver_external" {
  vpc_id          = aws_vpc.core_vpc.id
  dhcp_options_id = aws_vpc_dhcp_options.dhcp_external.id
}
