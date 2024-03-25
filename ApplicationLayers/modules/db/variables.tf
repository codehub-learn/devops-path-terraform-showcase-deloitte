variable "db_name" {
  description = "Database name"
  type = string
}

variable "vpc_name" {
  description = "VPC Name"
}

variable "username" {
  description = "User name"
  type = string
}

variable "password" {
  description = "Password"
  type = string
  sensitive = true
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}

variable "db_port" {
    description = "Database Port"
    type = number
}

variable "source_security_group_id" {
  description = "Source Security Group ID to access DB"
  type = string
}