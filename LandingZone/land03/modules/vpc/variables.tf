variable "vpc_cidr" {
  type = string
  description = "CIDR of VPC"
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