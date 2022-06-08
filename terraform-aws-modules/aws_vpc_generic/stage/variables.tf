variable "region" {
  description = "Region"
}

variable "account_id" {
  description = "The AWS account ID"
}

variable "vpc_cidr" {
  description = "IP range of Core VPC"
}

variable "environment" {
  description = "Z5X environment"
}

variable "subnets_cidrs" {
  description = "Subnet list with IP ranges"
  type        = "map"
}

variable "availability_zones" {
  description = "Availability zones that are going to be used for the subnets"
  type        = "list"
}

variable "vpc_name" {
  description = "VPC name related to the environment and the source market"
}
variable "sub_services_names" {
  description = "List with the names of the sub-services"
  type        = "map"
}
variable "common_tags" {
  type        = "map"
}
variable "dhcp_domain_names" {}
variable "dhcp_name_servers" {}
variable "enable_dns_hostnames" {}
variable "vpc_flow_log_group_name" {}
# variable "vpc_peering_cidr" {}