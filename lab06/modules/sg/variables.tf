variable "ingress_port" {
  type = number
  description = "Ingress Port"
}

variable "ingress_cidr" {
    type = list(string)
    description = "List of CIDRs to be allowed in ingress"
}

variable "egress_port" {
  type = number
  description = "Egress Port"
}

variable "egress_cidr" {
    type = list(string)
    description = "List of CIDRs to be allowed in egress"
}

variable "instance_name" {
  type = string
  description = "Instance Name"
}