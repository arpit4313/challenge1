variable "image_name" {
  description = "Name of Docker image"
}
variable "source_path" {
  description = "Path to Docker image source"
}
variable "tag" {
  description = "Tag to use for deployed Docker image"
}
variable "hash_script" {
  description = "Path to script to generate hash of source contents"
  default     = ""
}
variable "push_script" {
  description = "Path to script to build and push Docker image"
  default     = ""
}
variable "repository_url" {
  description = "Repository URL path"
}
variable "account_id" {
  description = "aws acccount id"
}
variable "role_name" {
  description = "role name"
  default = "z5x_jenkins"
}