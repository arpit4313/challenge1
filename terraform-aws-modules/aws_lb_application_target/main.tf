####################################################################
#### Created by : Kalyan Chakravarthi/ Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_lb_target_group" "lb_tg_port" {
  name        = "${var.name}-tg-${var.tg_port}"
  port        = var.tg_port
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type


  health_check {
    path                = var.health_path
    port                = var.health_port
    protocol            = var.health_protocol
    timeout             = "10"
    healthy_threshold   = "3"
    unhealthy_threshold = "3"
    matcher             = var.matcher
  }

  tags = {
    Name                = "${var.name}-tg-${var.tg_port}"
    Environment         = var.environment
    app-name            = var.app-name
    team-name           = var.team-name
    created-by          = var.created-by
    ticket              = var.ticket
    cost-center         = var.cost-center
    contact-email       = var.contact-email
    created-date        = var.created-date
    resource-function   = var.resource-function
    patch-exempt        = var.patch-exempt
    data-classification = var.data-classification
  }
}