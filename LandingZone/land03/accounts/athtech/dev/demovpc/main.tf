module "vpc" {
  source      = "../../../../modules/vpc"
  vpc_cidr    = var.vpc_cidr
  common_tags = var.common_tags
}