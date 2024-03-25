resource "aws_db_instance" "db" {
  allocated_storage    = 10
  db_name              = var.db_name
  identifier = var.db_name
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.username
  password             = var.password
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
  apply_immediately = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  parameter_group_name = "default.mysql5.7"

  skip_final_snapshot  = true
  tags = merge(
    var.common_tags,
    tomap({
      "Name" = "${var.db_name}",
      "Classification" = "private"
    })
  )
}


resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = data.aws_subnets.private.ids

  tags = merge(
    var.common_tags,
    tomap({
      "Name" = "${var.db_name}-subnet-group",
      "Classification" = "private"
    })
  )
}