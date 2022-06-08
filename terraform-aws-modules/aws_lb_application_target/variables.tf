variable "name" {
  description = "A small description"
}
variable "environment" {
  description = "Name of th eenvironment"
}
variable "vpc_id" {
  description = "VPC ID"
}
variable "tg_port" {
  description = "LB target port"
}
variable "protocol" {
  description = "LB target protocol"
}
variable "health_path" {
  description = "Health check path"
}
variable "health_port" {
  description = "Health check port"
}
variable "health_protocol" {
  description = "Health check protocol"
}
variable "target_type" {
  description = " target_type "
}
variable "matcher" {
  description = "The HTTP codes to use when checking for a successful response from a target. You can specify multiple values (for example, 200,202) or a range of values (for example, 200-299)"
  default     = null
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