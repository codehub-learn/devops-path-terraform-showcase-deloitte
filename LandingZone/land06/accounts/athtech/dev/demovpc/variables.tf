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

variable "public_subnet_az" {
  type        = string
  description = "Public Subnet AZ"
}

variable "public_subnet_cidr" {
  type        = string
  description = "Public Subnet CIDR"
}

variable "vm_ports" {
  type        = map(string)
  description = "Map of ingress ports for the vm"
}

variable "allowed_hosts" {
  type        = list(string)
  description = "Allowed CIDRs to access VM"
}