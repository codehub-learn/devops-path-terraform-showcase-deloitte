variable "ingress_port" {
  type = number
  description = "Ingress port"
}

variable "ingress_cidr" {
  type = list(string)
  description = "Ingress CIDRs"
}

variable "egress_port" {
  type = number
  description = "Egress Port"
}

variable "egress_cidr" {
  type = list(string)
  description = "Egress CIDRs"
}

variable "prefix" {
  type = string
  description = "Prefix for system"
  
}
