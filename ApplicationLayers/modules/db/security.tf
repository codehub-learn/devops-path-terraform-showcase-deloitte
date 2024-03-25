resource "aws_security_group" "db_security_group" {
  description = "${var.db_name}-sg"
  vpc_id      = data.aws_vpc.vpc.id
  tags = merge(
    var.common_tags,
    tomap({
      "Name" = "${var.db_name}-sg",
      "Classification" = "private"
    })
  )
}


resource "aws_security_group_rule" "allow_ingress_from_apps" {
  security_group_id = aws_security_group.db_security_group.id
  source_security_group_id = var.source_security_group_id
  type              = "ingress"
  from_port         = var.db_port
  to_port           = var.db_port
  protocol          = "tcp"
}
