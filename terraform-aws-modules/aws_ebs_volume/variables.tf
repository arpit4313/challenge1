variable "availability_zone" {
  description = "The AZ where the EBS volume will exist."
#  type        = string
}
variable "environment" {
  description = "name of the environment"
}
variable "size" {
  description = "The size of the drive in GiBs."
}
variable "name" {
  description = "Name of the Volume"
}
variable "Created_by" {
  default = "TF"
}
variable "type" {
  description = "The type of EBS volume. Can be standard, gp2, gp3, io1, io2, sc1 or st1 (Default: gp2)."
  default     = "gp2"
}
variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true."
  default     = null
}
variable "iops" {
  description = "The amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3"
  default     = null
}