resource "aws_instance" "bastion" {
    ami                         = var.bastion_ami_id
    instance_type               = "t3.micro"
    subnet_id                   = var.bastion_subnet_ids[0]
    associate_public_ip_address = true
    security_groups             = [aws_security_group.lz_bastion_sg.id]
    key_name                    = data.aws_key_pair.ssh_key.key_name
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
