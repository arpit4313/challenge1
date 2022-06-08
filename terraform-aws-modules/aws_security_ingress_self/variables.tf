variable "protocol" {
  description = "The name of the protocol"
}
variable "cidr_blocks" {
  description = "The name of the cidr_blocks"
  default     = null
}
variable "security_group_id" {
  description = "The name of the security_group_id"
}
variable "description" {
  description = "The name of the description"
}
variable "from_port" {
  description = "From port"
}
variable "to_port" {
  description = "To port"
}
variable "self" {
  description = "Self allow"
  default     = null
  type        = bool
}
