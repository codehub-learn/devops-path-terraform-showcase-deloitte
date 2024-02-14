region   = "eu-north-1"
vpc_cidr = "10.10.0.0/20"
common_tags = {
  "Env"     = "dev"
  "Owner"   = "Athtech"
  "Creator" = "kostas makedos"
  "Name"    = "myvpc"
}
public_subnet_az   = "eu-north-1a"
public_subnet_cidr = "10.10.0.0/24"