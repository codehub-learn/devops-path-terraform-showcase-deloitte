region   = "eu-north-1"
vpc_cidr = "10.10.0.0/20"
vpc_name = "myvpc"
common_tags = {
  "Env"     = "dev"
  "Owner"   = "Athtech"
  "Creator" = "kostas makedos"
  "Name"    = "myvpc"
}
public_subnet_az   = "eu-north-1a"
public_subnet_cidr = "10.10.0.0/24"
allowed_hosts      = ["178.148.0.0/16", "178.147.0.0/16", "0.0.0.0/0"]
vm_ports = {
  "22" = "22"
}