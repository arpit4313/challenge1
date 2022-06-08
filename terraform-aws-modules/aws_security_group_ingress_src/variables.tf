variable "protocol" {
  description = "The name of the protocol"
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
variable "source_security_group_id" {
  default = null
}