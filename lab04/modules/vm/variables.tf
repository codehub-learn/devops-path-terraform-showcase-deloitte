variable "instance_name" {
  type = string
  description = "Instance Name"
}

variable "ingress_port" {
    type = number
    description = "App Ingress Port"
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

variable "db_port" {
  
}