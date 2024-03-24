region             = "eu-north-1"
vpc_cidr           = "10.10.0.0/20"
availability_zones = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
vpc_name           = "demovpc"
common_tags = {
  "Env"     = "dev"
  "Owner"   = "Athtech"
  "Creator" = "kostas makedos"
  "Name"    = "demovpc"
}
allowed_hosts = ["178.148.0.0/16", "178.147.0.0/16"]
bastion_ports = {
  "22" = "22"
}
subnets_cidrs = {
  "public"  = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"],
  "private" = ["10.10.5.0/24", "10.10.6.0/24", "10.10.7.0/24"],
  "data"    = ["10.10.10.0/24", "10.10.11.0/24", "10.10.12.0/24"]
}

environments = [
  "periklis",
  "alin",
  "filipos",
  "andrea",
]