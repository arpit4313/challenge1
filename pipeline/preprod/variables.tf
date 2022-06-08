variable "name" {
  description = "Name of th application"
}
variable "account_id" {
  description = "Name of the account"
}
variable "region" {
  description = "Region of the account"
}
variable "environment" {
  description = "Name of the environment"
}
variable "vpc_id" {
  description = "Name of the VPC"
}
variable "tags" {
  type = map(string)
}
variable "threshold_high" {
  description = "Alarm threshold high"
}
variable "threshold_low" {
  description = "Alarm threshold low"
}
variable "scale_depends_on" {
  description = "scale_depends_on"
  type        = any
  default     = []
}
variable "target_type" {
  description = " target_type "
}
variable "search_pattern" {
  default = "*sub"
}
variable "instana_agent_key" {
  description = "instana_agent_key"
}
variable "instana_agent_url" {
  description = "instana_agent_url"
}
variable "instana_timeout" {
  description = "instana_timeout"
}
variable "tag" {
  description = "tag of ecr image"
}