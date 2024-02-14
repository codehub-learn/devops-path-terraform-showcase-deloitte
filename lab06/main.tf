
module "vm-a" {
  source = "./modules/vm"
  instance_name = "${var.prefix}-vm-a"
  ingress_port = var.ingress_port
  egress_cidr = var.egress_cidr
  ingress_cidr = var.ingress_cidr
  egress_port = var.egress_port
}
