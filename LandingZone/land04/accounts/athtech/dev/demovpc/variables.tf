variable "region" {
  type        = string
  description = "Region to be used"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to be used by all components"
}

variable "public_subnet_az" {
  type        = string
  description = "Public Subnet AZ"
}

variable "public_subnet_cidr" {
  type        = string
  description = "Public Subnet CIDR"
}