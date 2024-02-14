module "vpc" {
  source             = "../../../../modules/vpc"
  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr
  common_tags        = var.common_tags
  public_subnet_az   = var.public_subnet_az
  public_subnet_cidr = var.public_subnet_cidr
}