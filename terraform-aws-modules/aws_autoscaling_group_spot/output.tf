output "asg" {
  value = aws_autoscaling_group.asg_spot.name
}
output "asg_arn" {
  value = aws_autoscaling_group.asg_spot.arn
}