
variable "username" {
  description = "The name of the username"
}

variable "password" {
  description = "The name of the password"
}

variable "db_subnet_group_name" {
  description = "The name of the db_subnet_group_name"
}
variable "name" {
  description = "name"
}
variable "engine" {
  description = "type of engine"
}
variable "engine_mode" {
  description = "type of engine_mode"
}
variable "engine_version" {
  description = "type of engine version"
}
variable "availability_zones" {
  description = "list of availability_zones"
}
variable "kms_key_id" {
  description = "kms_key_id of aurora cluster"
}
variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB cluster is deleted."
}
variable "storage_encrypted" {
  description = "The name of the storage_encrypted"
}
variable "vpc_security_group_ids" {
  description = "list of vpc_security_group_ids"
}