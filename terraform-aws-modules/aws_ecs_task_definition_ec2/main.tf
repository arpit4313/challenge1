####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
################ ECS Task Definitions ###############
resource "aws_ecs_task_definition" "ecs_taskdefinition" {
  family                   = var.family
  container_definitions    = data.template_file.taskdefinition_template.rendered
  network_mode             = var.network_mode
  requires_compatibilities = ["EC2"]
  cpu                      = var.ecs_taskdefinition_cpu
  memory                   = var.ecs_taskdefinition_memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn
}

########################### IAM Service Roles ###########################
data "template_file" "taskdefinition_template" {
  template = file("files/${var.task-definition-file-name}.json.tpl")
  vars = {
    account_id        = var.account_id
    name              = var.name
    hostPort          = var.hostPort
    containerPort     = var.containerPort
    region            = var.region
    environment       = var.environment
    instana_agent_key = var.instana_agent_key
    instana_agent_url = var.instana_agent_url
    instana_timeout   = var.instana_timeout
    version_no        = var.version_no
    task_role_arn     = var.task_role_arn
    tag               = var.tag
  }
}