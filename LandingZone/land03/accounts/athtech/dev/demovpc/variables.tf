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