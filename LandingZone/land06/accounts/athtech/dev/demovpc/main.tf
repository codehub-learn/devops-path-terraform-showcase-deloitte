module "vpc" {
  source             = "../../../../modules/vpc"
  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr
  common_tags        = var.common_tags
  public_subnet_az   = var.public_subnet_az
  public_subnet_cidr = var.public_subnet_cidr
}

module "vm" {
  source        = "../../../../modules/vm"
  common_tags   = var.common_tags
  vpc_id        = module.vpc.vpc_id
  allowed_hosts = var.allowed_hosts
  vm_ports      = var.vm_ports
  subnet_ids    = module.vpc.public_subnet_ids
}