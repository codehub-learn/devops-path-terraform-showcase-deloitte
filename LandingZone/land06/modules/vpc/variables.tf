variable "vpc_cidr" {
  type = string
  description = "CIDR of VPC"
}

variable "vpc_name" {
  type = string
  description = "VPC Name"
}

variable "enable_dns_hostnames" {
  type = bool
  description = "Enable dns hostnames for VMs"
  default = true
}

variable "common_tags" {
  type = map(string)
  description = "Default Tags to add to all components"
}

variable "public_subnet_az" {
  type        = string
  description = "Public Subnet AZ"
}

variable "public_subnet_cidr" {
  type        = string
  description = "Public Subnet CIDR"
}