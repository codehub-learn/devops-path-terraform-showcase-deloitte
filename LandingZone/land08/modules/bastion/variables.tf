variable "common_tags" {
  type = map(string)
  description = "Default Tags to add to all components"
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "bastion_ports" {
  type = map(string)
  description = "Map of ingress ports for the VM"
}

variable "allowed_hosts" {
  type = list(string)
  description = "List of CIDRs allowed to access VM"
}

variable "subnet_ids" {
  type = list(string)
  description = "List of subnets to use for creating vm" 
}