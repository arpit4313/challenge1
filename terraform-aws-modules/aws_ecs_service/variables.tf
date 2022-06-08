variable "name" {
  description = "Name of application"
}
#variable "common_tags" {
#  type = map(string)
#}
variable "environment" {
  description = "Name of the environment"
}
variable "cluster_id" {
  description = "ARN of an ECS cluster"
}
variable "task_definition_arn" {
  description = "Full ARN of the task definition that you want to run in your service."
}
variable "desired_count" {
  description = "desired count"
}
variable "lb_tg_arn" {
  description = "LB target group arn"
}
variable "port" {
  description = "Container port"
}
variable "security_group_id" {
  description = "Security group Id"
}
variable "subnets" {
  description = "subnets"
}
variable "aws_alb" {
  description = "aws_alb"
}
variable "ecs_iam_role" {
  description = "ecs_iam_role"
  default     = null
}
variable "assign_public_ip" {
  description = "Assign public ip true/false"
  type        = bool
}
variable "force_new_deployment" {
  description = "Enable to force a new task deployment of the service"
  default     = null
}
variable "platform_version" {
  description = "The platform version on which to run your service. Only applicable for launch_type set to FARGATE. Defaults to LATEST"
  default     = null
}
#variable "created-by" {
#  default = null
#  description = "Terraform/Manual"
#}
#variable "app-name" {
#  default = null
#  description = "Name of the application"
#}
#variable "contact-email" {
#  default = null
#  description = "Architect email address/Requester email address"
#}
#variable "created-date" {
#  default = null
#  description = "created-date"
#}
#variable "ticket" {
#  default = null
#  description = "NoC Ticket Num"
#}
#variable "cost-center" {
#  default = null
#  description = "Accepted Values are API name or Project name"
#}
#variable "resource-function" {
#  default = null
#  description = "Describe the function of a particular resource (such as web server, message broker, database)"
#}
#variable "patch-exempt" {
#  default = null
#  description = "yes/no"
#}
#variable "data-classification" {
#  default = null
#  description = "HBI/MBI/LBI"
#}
#variable "team-name" {
#  default = null
#  description = "API/Dept"
#}