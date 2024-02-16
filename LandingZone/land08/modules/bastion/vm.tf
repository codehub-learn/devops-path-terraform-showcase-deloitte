resource "aws_instance" "bastion" {
    ami                         = data.aws_ami.ubuntu.id
    instance_type               = "t3.micro"
    subnet_id                   = var.subnet_ids[0]
    associate_public_ip_address = true
    security_groups             = [aws_security_group.bastion_sg.id]
    key_name                    = aws_key_pair.bastion_key.key_name
    lifecycle {
        ignore_changes = [security_groups]
    }
    tags = merge(
        var.common_tags,
        tomap({
        "Name" = "bastion",
        "Classification" = "public"
        })
  )
}
