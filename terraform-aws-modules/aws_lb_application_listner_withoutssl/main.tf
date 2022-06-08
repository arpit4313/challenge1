
resource "aws_lb_listener" "lb_listner" {
  load_balancer_arn = var.alb_arn
  port              = var.alb_lb_port
  protocol          = var.protocol

  default_action {
    target_group_arn = var.target_group_arn
    type             = "forward"
  }
}