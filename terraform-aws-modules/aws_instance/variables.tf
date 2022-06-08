variable "ami" {
  description = "The name of the ami"
}
variable "instance_type" {
  description = "The name of the instance_type"
}
variable "tags" {
  description = "The name of the tags"
}

variable "user_data" {
  description = "The name of the user_data"
}
variable "subnet_id" {
  description = "The name of the subnet_id"
}
variable "vpc_security_group_ids" {
  description = "The name of the vpc_security_group_ids"
}
variable "name" {
  description = "name of the instance"
}
variable "environment" {
  description = "Environment name"
}
variable "iam_instance_profile" {
  description = "Name of iam_instance_profile "
}
variable "key_name" {
  description = "SSH Key Name"
  default = ""
}
variable "associate_public_ip_address" {
  description = "Assigining public ip"
  type = bool
}
