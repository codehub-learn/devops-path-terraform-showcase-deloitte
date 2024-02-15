resource "aws_security_group" "vm_sg" {
    name        = "vm_sg"
    description = "Security Group For VM"
    vpc_id      = var.vpc_id
    tags = merge(
    var.common_tags,
    tomap({
      "Name" = "vm-sg",
      "Classification" = "public"
    })
  )
}

resource "aws_security_group_rule" "vm_egress" {
    from_port = 0
    protocol = "-1"
    security_group_id = aws_security_group.vm_sg.id
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    type = "egress"

}
resource "aws_security_group_rule" "vm_ingress" {
    for_each = var.vm_ports
    from_port = each.key
    to_port = each.value
    protocol = "tcp"
    security_group_id = aws_security_group.vm_sg.id
    cidr_blocks = var.allowed_hosts
    type = "ingress"
}

resource "aws_key_pair" "vm_key" {
    public_key = file("${path.module}/files/public_key")
}