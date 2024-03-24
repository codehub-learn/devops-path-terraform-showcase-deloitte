variable "region" {
  type        = string
  description = "Region to be used"
}

variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to be used by all components"
}

variable "bastion_ports" {
  type        = map(string)
  description = "Map of ingress ports for the bastion"
}

variable "allowed_hosts" {
  type        = list(string)
  description = "Allowed CIDRs to access VM"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability Zones"
}

variable "subnets_cidrs" {
  description = "Subnet list with IP ranges"
  type        = map(list(string))
}

variable "environments" {
  description = "Map of environments to create"
  type        = list(string)
}