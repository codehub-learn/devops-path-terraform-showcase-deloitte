#module "java-app" {
#  source           = "../../../modules/app"
#  vpc_name         = var.vpc_name
#  application_name = "${var.env_name}-java"
#  ingress_ports    = ["80"]
#  common_tags      = var.common_tags
#}
#