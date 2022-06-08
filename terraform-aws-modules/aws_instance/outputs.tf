output "ec2_private_ip" {
  value = aws_instance.ec2_instance.private_ip
}
output "ec2_public_ip" {
  value = aws_instance.ec2_instance.associate_public_ip_address
}
output "iam_instance_profile" {
  value = aws_instance.ec2_instance.iam_instance_profile
}
output "ec2_id" {
  value = aws_instance.ec2_instance.id
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = aws_instance.ec2_instance.*.availability_zone
}
