variable "name" {
  description = "Name of th application"
}
variable "account_id" {
  description = "Name of the account"
}
variable "trust_relationship" {
  description = "Trust Relationship Policy"
}
variable "custom_policy" {
  description = "Custom Policy"
}
variable "environment" {
  default = null
  description = "name of the env"
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