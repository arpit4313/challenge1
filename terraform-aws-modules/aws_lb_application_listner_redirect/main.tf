####################################################################
#### Created by : Kalyan Chakravarthi/ Kalyan Bhave ####
#### Date : 20-Jun-2020 ####
#### Updated by : Balakrishna/ Praveen kumar/ Sathish kumar ####
####################################################################
resource "aws_lb_listener" "lb_listner" {
  load_balancer_arn = var.alb_arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type = "redirect"
    redirect {
      port        = var.redirect_port
      protocol    = var.redirect_protocol
      status_code = var.redirect_status_code
    }
  }
}