output "rds_db_instance_id" {
  description = "The db subnet group name"
  value       = aws_rds_cluster_instance.aurora_rds_instance.id
}

output "rds_db_instance_arn" {
  description = "The db subnet group name"
  value       = aws_rds_cluster_instance.aurora_rds_instance.arn
}

output "rds_db_instance_endpoint" {
  description = "The db subnet group name"
  value       = aws_rds_cluster_instance.aurora_rds_instance.endpoint
}