module "vpc" {
  source             = "../../../../modules/vpc"
  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr
  common_tags        = var.common_tags
  availability_zones = var.availability_zones
  subnets_cidrs      = var.subnets_cidrs
}

module "vm" {
  source        = "../../../../modules/bastion"
  common_tags   = var.common_tags
  vpc_id        = module.vpc.vpc_id
  allowed_hosts = var.allowed_hosts
  bastion_ports = var.bastion_ports
  subnet_ids    = module.vpc.public_subnet_ids
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.vpc_name}-aws-demo-app-infra"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
  tags = var.common_tags
}

resource "aws_dynamodb_table" "application_state_lock_dynamodb_table" {
  name           = "${var.vpc_name}-aws-demo-app-lock"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = var.common_tags
}