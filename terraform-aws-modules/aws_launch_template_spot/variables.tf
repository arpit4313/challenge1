variable "name" {}
variable "image_id" {}
variable "instance_type" {
  description = "Instance type"
  default = "t2.xlarge"
}
variable "key_name" {}
variable "security_group" {}
variable "account_id" {}

variable "instance_profile_role_name" {
  default = "instance profile role name"
}

variable "user_data" {}

variable "Created_using" {
  default = null
}
variable "resource_type" {
  default = null
}
variable "created-by" {
  default = null
  description = "Terraform/Manual"
}
variable "app-name" {
  default = null
  description = "Name of the application"
}
variable "contact-email" {
  default = null
  description = "Architect email address/Requester email address"
}
variable "created-date" {
  default = null
  description = "created-date"
}
variable "ticket" {
  default = null
  description = "NoC Ticket Num"
}
variable "cost-center" {
  default = null
  description = "Accepted Values are API name or Project name"
}
variable "resource-function" {
  default = null
  description = "Describe the function of a particular resource (such as web server, message broker, database)"
}
variable "patch-exempt" {
  default = null
  description = "yes/no"
}
variable "data-classification" {
  default = null
  description = "HBI/MBI/LBI"
}
variable "team-name" {
  default = null
  description = "API/Dept"
}
variable "environment" {
  default = null
}