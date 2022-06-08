variable "name" {
  description = "Name of the ECS Policy created, will appear in Auto Scaling under Service in ECS"
  type        = string
}

variable "target_value" {
  description = "Requests per target in target group metrics to trigger scaling activity"
  type        = number
}

variable "scale_in_cooldown" {
  description = "Time between scale in action"
  default     = 300
  type        = number
}

variable "scale_out_cooldown" {
  description = "Time between scale out action"
  default     = 300
  type        = number
}

variable "disable_scale_in" {
  description = "Disable scale-in action, defaults to false"
  default     = false
  type        = bool
}
variable "predefined_metric_type" {
  description = "Metric type"
}

variable "ecs_cluster_name" {
  description = "Name of cluster"
}

variable "ecs_service_name" {
  description = "Name of the service"
}
variable "min_count" {
  description = "Min count"
}

variable "max_count" {
  description = "mac count"
}