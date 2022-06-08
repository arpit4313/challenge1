variable "asg_desired_capacity" {
  description = "Desired capacity"
}

variable "asg_min_size" {
  description = "Minimum scaling group"
}

variable "asg_max_size" {
  description = "Maximum scaling"
}

variable "availability_zones" {
  default = null
}

variable "health_check_type" {
  default = "EC2"
}

variable "health_check_grace_period" {
  default = "300"
}
variable "name" {}

variable "environment" {}

variable "vpc_id" {}

variable "instance_type5" {
  description = "Select an instance size for the controller."
  default     = "t3a.medium"
}

variable "instance_type6" {
  description = "Select an instance size for the controller."
  default     = "t3.medium"
}

variable "instance_type7" {
  description = "Select an instance size for the controller."
  default     = "t2.medium"
}

variable "instance_type8" {
  description = "Select an instance size for the controller."
  default     = "t4g.medium"
}

variable "key_name" {}

variable "security_group" {}

variable "account_id" {}

variable "vpc_zone_identifier" {
  default = null
}

variable "launch_template_id" {}

variable "weighted_capacity" {
  description = "The number of capacity units, which gives the instance type a proportional weight to other instance type"
  default = "1"
}
variable "default_cooldown" {
  description = "Time between a scaling activity and the succeeding scaling activity."
  default = "300"
}

variable "on_demand_base_capacity" {
  default = 5
}

#variable "common_tags" {
#  type = map(string)
#}

variable "tag" {
  default = []
  type = any
}
variable "target_group_arns" {
  default = null
}
variable "created-by" {
  default = "default"
  description = "Terraform/Manual"
}
variable "app-name" {
  default = "default"
  description = "Name of the application"
}
variable "contact-email" {
  default = "default"
  description = "Architect email address/Requester email address"
}
variable "created-date" {
  default = "default"
  description = "created-date"
}
variable "ticket" {
  default = "default"
  description = "NoC Ticket Num"
}
variable "cost-center" {
  default = "default"
  description = "Accepted Values are API name or Project name"
}
variable "resource-function" {
  default = "default"
  description = "Describe the function of a particular resource (such as web server, message broker, database)"
}
variable "patch-exempt" {
  default = "default"
  description = "yes/no"
}
variable "data-classification" {
  default = "default"
  description = "HBI/MBI/LBI"
}
variable "team-name" {
  default = "default"
  description = "API/Dept"
}