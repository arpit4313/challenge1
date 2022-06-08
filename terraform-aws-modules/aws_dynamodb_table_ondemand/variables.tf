variable "name" {
  default = "Name of the table"
}
variable "billing_mode" {
  default = "PROVISIONED"
}
variable "read_capacity" {
  default = 5
}
variable "write_capacity" {
  default = 5
}
variable "hash_key" {
  description = "The attribute to use as the hash (partition) key."
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