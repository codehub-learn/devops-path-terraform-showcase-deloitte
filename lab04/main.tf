locals {
  instance_name = random_pet.petname.id
}

resource "random_pet" "petname" {
  length    = 5
  separator = "-"
  prefix = var.prefix
}

module "ec2" {
  source = "./modules/vm"
  instance_name = local.instance_name
  ingress_port = var.ingress_port
  egress_cidr = var.egress_cidr
  ingress_cidr = var.ingress_cidr
  egress_port = var.egress_port
}

#module "s3_bucket" {
#  source = "github.com/codehub-learn/devops-path-terraform-showcase-deloitte.git/modules/s3"
#  bucket_name = "${var.prefix}-${local.instance_name}"
#}
