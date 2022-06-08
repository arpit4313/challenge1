####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
#data "external" "hash" {
#  program = [coalesce(var.hash_script, "${path.module}/hash.sh"), var.source_path]
#}

# Build and push the Docker image whenever the hash changes
#     command     = "${coalesce(var.push_script, "${path.module}/push.sh")} ${var.source_path} ${var.repository_url} ${var.tag}"
resource "null_resource" "push" {
#  triggers = {
#    hash = lookup(data.external.hash.result, "hash")
#  }

  provisioner "local-exec" {
    command     = "${coalesce(var.push_script, "${path.module}/deploy.sh")} ${var.source_path} ${var.repository_url} ${var.tag} ${var.ecs_cluster_name} ${var.ecs_service_name} ${var.ecs_task_definition} ${var.account_id} ${var.role_name}"
    interpreter = ["bash", "-c"]
  }
}