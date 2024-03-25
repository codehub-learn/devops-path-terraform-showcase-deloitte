module "db" {
  source                   = "../../../modules/db"
  vpc_name                 = var.vpc_name
  db_name                  = "${var.env_name}-db"
  common_tags              = var.common_tags
  username                 = "mydb"
  password                 = "s3cr3t"
  db_port                  = 3306
  source_security_group_id = module.python-app.app_security_group_id
}
