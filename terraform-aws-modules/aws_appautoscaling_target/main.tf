####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
############### auto scaling for target tracking  ###############
resource "aws_appautoscaling_target" "asg_target_tracking" {
  service_namespace  = "ecs"
  resource_id        = "service/${var.ecs_cluster_name}/${var.ecs_service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = var.min_count
  max_capacity       = var.max_count
}
resource "aws_appautoscaling_policy" "ecs_policy" {
  name               = var.name
  resource_id        = aws_appautoscaling_target.asg_target_tracking.resource_id
  scalable_dimension = aws_appautoscaling_target.asg_target_tracking.scalable_dimension
  service_namespace  = aws_appautoscaling_target.asg_target_tracking.service_namespace
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    target_value       = var.target_value
    disable_scale_in   = var.disable_scale_in
    scale_in_cooldown  = var.scale_in_cooldown
    scale_out_cooldown = var.scale_out_cooldown

    predefined_metric_specification {
      predefined_metric_type = var.predefined_metric_type
    }
  }
}
