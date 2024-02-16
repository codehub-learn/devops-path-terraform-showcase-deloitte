resource "aws_security_group" "bastion_sg" {
    name        = "bastion_sg"
    description = "Security Group For Bastion"
    vpc_id      = var.vpc_id
    tags = merge(
    var.common_tags,
    tomap({
      "Name" = "bastion-sg",
      "Classification" = "public"
    })
  )
}

resource "aws_security_group_rule" "bastion_egress" {
    from_port = 0
    protocol = "-1"
    security_group_id = aws_security_group.bastion_sg.id
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    type = "egress"

}
resource "aws_security_group_rule" "bastion_ingress" {
    for_each = var.bastion_ports
    from_port = each.key
    to_port = each.value
    protocol = "tcp"
    security_group_id = aws_security_group.bastion_sg.id
    cidr_blocks = var.allowed_hosts
    type = "ingress"
}

resource "aws_key_pair" "bastion_key" {
    public_key = file("${path.module}/files/public_key")
}