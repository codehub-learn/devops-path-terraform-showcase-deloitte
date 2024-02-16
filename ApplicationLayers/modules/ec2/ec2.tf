resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.vm_key.key_name
  associate_public_ip_address = var.associate_public_ip
  vpc_security_group_ids = concat(var.security_group_ids)
  subnet_id = var.subnet_id
  user_data = var.user_data
  root_block_device {
    volume_type = "gp3"
    volume_size = var.root_volume_size
  }
  tags = var.common_tags
}

output "private_ip" {
  value = aws_instance.ec2.private_ip
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "instance_id" {
  value = aws_instance.ec2.id
}

resource "aws_key_pair" "vm_key" {
    public_key = file("${path.module}/files/public_key")
}