output "aurora_rdb_parameter_group_id" {
  description = "The db parameter group id"
  value       = aws_rds_cluster_parameter_group.aurora.id
}
output "aurora_rdb_parameter_group_name" {
  description = "The db parameter group name"
  value       = aws_rds_cluster_parameter_group.aurora.name
}
