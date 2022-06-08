####################################################################
#### Created by : Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_autoscaling_group" "asg_spot" {
  availability_zones        = var.availability_zones
  name_prefix               = "${var.name}_asg"
  termination_policies      = ["Default"]
  enabled_metrics           = [
    "GroupTerminatingInstances", "GroupMaxSize", "GroupDesiredCapacity", "GroupPendingInstances",
    "GroupInServiceInstances", "GroupMinSize", "GroupTotalInstances"
  ]
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  default_cooldown          = var.default_cooldown
  desired_capacity          = var.asg_desired_capacity
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  vpc_zone_identifier       = var.vpc_zone_identifier
  target_group_arns         = var.target_group_arns
  force_delete              = true
  protect_from_scale_in     = true
  mixed_instances_policy {
    instances_distribution {
      on_demand_percentage_above_base_capacity = 50
      spot_allocation_strategy                 = "capacity-optimized"
      on_demand_base_capacity                  = var.on_demand_base_capacity
    }
    launch_template {
      launch_template_specification {
        launch_template_id = var.launch_template_id
        version            = "$Latest"
      }
      override {
        instance_type     = var.instance_type5
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type6
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type7
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type8
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type9
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type10
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type11
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type12
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type13
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type14
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type15
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type16
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type17
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type18
        weighted_capacity = var.weighted_capacity
      }
      override {
        instance_type     = var.instance_type19
        weighted_capacity = var.weighted_capacity
      }
    }
  }

  lifecycle {
    create_before_destroy = "true"
    ignore_changes        = [desired_capacity, min_size]
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = "true"
  }

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = "true"
  }

#
#  tags = merge(
#  var.common_tags,
#  map("Classification", "private"),
#  map("Name", var.environment)
#  )

#  dynamic "tag" {
#    for_each = var.tag
#    content {
#      key                 = lookup(tag.value, "key", [])
#      propagate_at_launch = lookup(tag.value, "propagate_at_launch", [])
#      value               = lookup(tag.value, "value", [])
#    }
#  }
  tag {
    key                 = "app-name"
    value               = var.app-name
    propagate_at_launch = "true"
  }
  tag {
    key                 = "created-by"
    value               = var.created-by
    propagate_at_launch = "true"
  }
  tag {
    key                 = "contact-email"
    value               = var.contact-email
    propagate_at_launch = "true"
  }
  tag {
    key                 = "cost-center"
    value               = var.cost-center
    propagate_at_launch = "true"
  }
  tag {
    key                 = "created-date"
    value               = var.created-date
    propagate_at_launch = "true"
  }
  tag {
    key                 = "ticket"
    value               = var.ticket
    propagate_at_launch = "true"
  }
  tag {
    key                 = "resource-function"
    value               = var.resource-function
    propagate_at_launch = "true"
  }
  tag {
    key                 = "patch-exempt"
    value               = var.patch-exempt
    propagate_at_launch = "true"
  }
  tag {
    key                 = "data-classification"
    value               = var.data-classification
    propagate_at_launch = "true"
  }
  tag {
    key                 = "team-name"
    propagate_at_launch = "true"
    value               = var.team-name
  }
}
