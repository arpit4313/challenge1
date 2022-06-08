variable "auto_scaling_group_arn" {}

variable "name" {}

variable "target_capacity" {}

variable "minimum_scaling_step_size" {
  default = 1
}

variable "maximum_scaling_step_size" {
  default = 1000
}