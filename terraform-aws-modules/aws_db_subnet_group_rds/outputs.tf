output "rds_subnet_group_id" {
  description = "The db parameter group id"
  value       = aws_db_subnet_group.rds.id
}
output "rds_subnet_group_name" {
  description = "The db parameter group name"
  value       = aws_db_subnet_group.rds.name
}
