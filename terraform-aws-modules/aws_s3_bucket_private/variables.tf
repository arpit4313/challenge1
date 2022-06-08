variable "name" {
  description = "Name of s3 bucket"
}

variable "acl" {
  description = "bucket acl"
  default     = "private"
}

variable "enable_versioning" {
  description = "enable bucket versioning"
  default     = "true"
}
variable "block_public_policy" {
  default = "false"
}
variable "block_public_acls" {
  default = "false"
}
variable "environment" {
  description = "name of the environment"
}
variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for buckets in this account. Defaults to false. Enabling this setting does not affect the persistence of any existing ACLs and doesn't prevent new public ACLs from being set. When set to true causes Amazon S3 to:"
  default = "false"
}
variable "restrict_public_buckets" {
  description = " Whether Amazon S3 should restrict public bucket policies for buckets in this account. Defaults to false. Enabling this setting does not affect previously stored bucket policies, except that public and cross-account access within any public bucket policy, including non-public delegation to specific accounts, is blocked. When set to true"
  default = "false"
}