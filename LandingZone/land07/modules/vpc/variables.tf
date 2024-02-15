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

variable "availability_zones" {
  type = list(string)
  description = "Availability Zones"
}

variable "subnets_cidrs" {
  description = "Subnet list with IP ranges"
  type        = map(list(string))
}