variable "name" {
  description = "The name of the SNS topic to create"
  type        = string
  default     = null
}
variable "tags" {
  default = null
  type = map(string)
}