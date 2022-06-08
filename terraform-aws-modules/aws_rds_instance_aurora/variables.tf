variable "identifier" {
  description = "The name of the identifier"
}
variable "cluster_identifier" {
  description = "The name of the cluster identifier"
}
variable "engine" {
  description = "The name of the engine"
}
variable "engine_version" {
  description = "The name of the engine_version"
}
variable "instance_class" {
  description = "The name of the instance_class"
}

variable "db_subnet_group_name" {
  description = "The name of the db_subnet_group_name"
}
variable "db_parameter_group_name" {
  description = "The name of the parameter_group_name"
  default     = null
}
variable "performance_insights_enabled" {
  description = "Specifies whether Performance Insights are enabled"
}

variable "apply_immediately" {
  description = "The name of the apply_immediately"
  default     = null
}

variable "name" {
  description = "name"
}