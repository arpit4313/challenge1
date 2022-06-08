module "redis_instance" {
  source                        = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//redis/elasticache_replication_group?ref=main"
  replication_group_description = "This REDIS Cluster is used for Zee5 new b2b-adminpanel application for preprod environment"
  replication_group_id          = "${var.name}-${var.environment}"
  engine                        = "redis"
  engine_version                = "5.0.6"
  node_type                     = "cache.t2.medium"
  port                          = 6379
  subnet_group_name             = module.redis_subnet_group.redis_sg_name
  security_group_ids            = [module.sg.sg_id]
  parameter_group_name          = "default.redis5.0.cluster.on"
  at_rest_encryption_enabled    = true
  transit_encryption_enabled    = true
  maintenance_window            = "sun:06:00-sun:07:00"
  auto_minor_version_upgrade    = false
  apply_immediately             = true
  automatic_failover_enabled    = true
  num_node_groups               = "2"
  replicas_per_node_group       = "1"
}
module "redis_subnet_group" {
  source      = "git@github.com/arpit4313/challenge1/terraform-aws-modules.git//redis/elasticache_subnet_group?ref=develop"
  name        = var.name
  description = "Private subnets for the ElastiCache instances: new b2b-adminpanel"
  subnet_ids  = [module.vpc.subnet_data_az1_id, module.vpc.subnet_data_az2_id, module.vpc.subnet_data_az3_id]
}