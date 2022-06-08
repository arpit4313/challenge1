####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_ecs_capacity_provider" "capacity_provider" {
  name = var.name
  auto_scaling_group_provider {
    auto_scaling_group_arn         = var.auto_scaling_group_arn
    managed_termination_protection = "ENABLED"
    managed_scaling {
      maximum_scaling_step_size = var.maximum_scaling_step_size
      minimum_scaling_step_size = var.minimum_scaling_step_size
      status                    = "ENABLED"
      target_capacity           = var.target_capacity
    }
  }
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [name]
  }
}
