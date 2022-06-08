variable "name" {
  description = "Name of application"
}
variable "account_id" {
  description = "AWS Account ID"
}
variable "common_tags" {
  type = map(string)
}
variable "environment" {
  description = "Name of the environment"
}
variable "family" {
  description = "family of task definition"
}
variable "ecs_taskdefinition_cpu" {
  description = "Fargate CPU size"
}
variable "ecs_taskdefinition_memory" {
  description = "Fargate Momory"
}
variable "execution_role_arn" {
  description = "Execution role arn"
}
variable "region" {
  description = "region"
}
variable "task-definition-file-name" {
  description = "task definition templete file"
}
variable "task_role_arn" {
  description = "role arn "
  default = null
}
variable "instana_agent_key" {
  description = "instana agent key"
  default     = null
}
variable "instana_agent_url" {
  description = "instana agent url"
  default     = null
}
variable "instana_timeout" {
  description = "instana_timeout"
  default     = null
}
variable "version_no" {
  description = "version no"
  default     = null
}
variable "network_mode" {
  description = "network mode"
  default     = "awsvpc"
}
variable "containerPort" {
  default = ""
}
variable "hostPort" {
  default = ""
}
variable "tag" {
  description = "tag"
  default     = null
}