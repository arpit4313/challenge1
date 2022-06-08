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
  default     = "r4.xlarge"
}

variable "instance_type6" {
  description = "Select an instance size for the controller."
  default     = "r4.large"
}

variable "instance_type7" {
  description = "Select an instance size for the controller."
  default     = "m5a.xlarge"
}

variable "instance_type8" {
  description = "Select an instance size for the controller."
  default     = "m5ad.xlarge"
}

variable "instance_type9" {
  description = "Select an instance size for the controller."
  default     = "m4.xlarge"
}

variable "instance_type10" {
  description = "Select an instance size for the controller."
  default     = "r5.xlarge"
}

variable "instance_type11" {
  description = "Select an instance size for the controller."
  default     = "r5d.xlarge"
}

variable "instance_type12" {
  description = "Select an instance size for the controller."
  default     = "r5a.xlarge"
}

variable "instance_type13" {
  description = "Select an instance size for the controller."
  default     = "r5ad.xlarge"
}

variable "instance_type14" {
  description = "Select an instance size for the controller."
  default     = "m5.xlarge"
}

variable "instance_type15" {
  description = "Select an instance size for the controller."
  default     = "r3.xlarge"
}

variable "instance_type16" {
  description = "Select an instance size for the controller."
  default     = "c4.xlarge"
}

variable "instance_type17" {
  description = "Select an instance size for the controller."
  default     = "c5n.xlarge"
}

variable "instance_type18" {
  description = "Select an instance size for the controller."
  default     = "c5d.xlarge"
}

variable "instance_type19" {
  description = "Select an instance size for the controller."
  default     = "c5.xlarge"
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

variable "weighted_capacity_r4_xlarge" {
  description = "The number of capacity units, which gives the instance type a proportional weight to other instance type"
  default = "20"
}
variable "default_cooldown" {
  description = "Time between a scaling activity and the succeeding scaling activity."
  default = "300"
}

variable "on_demand_base_capacity" {
  default = 5
}
variable "tag" {
  default = []
  type = any
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