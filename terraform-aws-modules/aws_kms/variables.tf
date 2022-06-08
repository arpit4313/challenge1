variable "project" {
  description = "Name of the project"
}

variable "region" {
  description = "Region of deployment"
}

variable "account_id" {
  description = "aws acccount id"
}

variable "environment" {
  description = "Name of the environment"
}

variable "key_alias" {
  description = "Name of the aws service. Eg: s3, ebs, rds etc."
}

variable "policy" {
  description = "Policy file that has to be attached"
}

variable "encryption_type" {
  description = "Unless specified, we will leverage AWS provided KMS keys"
  default     = "KMS"
}

variable "is_enabled" {
  description = "Specifies whether the key is enabled. Defaults to true."
  default     = "true"
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled. Defaults to false."
  default     = "true"
}

variable "deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days"
  default     = "30"
}
variable "key_usage" {
  description = "Specifies the intended use of the key. Defaults to ENCRYPT_DECRYPT, and only symmetric encryption and decryption are supported."
  default     = "ENCRYPT_DECRYPT"
}
variable "Created_using" {
  default = null
}