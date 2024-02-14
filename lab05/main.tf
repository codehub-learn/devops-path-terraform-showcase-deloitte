
module "vm-a" {
  source = "./modules/vm"
  instance_name = "${var.prefix}-vm-a"
  ingress_port = var.ingress_port
  egress_cidr = var.egress_cidr
  ingress_cidr = var.ingress_cidr
  egress_port = var.egress_port
}

module "vm-b" {
  source = "./modules/vm"
  instance_name = "${var.prefix}-vm-b"
  ingress_port = var.ingress_port
  egress_cidr = var.egress_cidr
  ingress_cidr = ["${module.vm-a.vm-public-ip}/32"]
  egress_port = var.egress_port
  depends_on = [ module.vm-a ]
}