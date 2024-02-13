data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

module "aws_sg" {
 source = "../../modules/sg"
 egress_cidr = var.egress_cidr
 ingress_cidr = var.ingress_cidr
 ingress_port = var.ingress_port
 egress_port = var.egress_port
}

resource "aws_instance" "instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [module.aws_sg.security_group_id]
  user_data              = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              sed -i -e 's/80/"${var.ingress_port}"/' /etc/apache2/ports.conf
              echo "Hello World" > /var/www/html/index.html
              systemctl restart apache2
              EOF
  tags = {
    Name = var.instance_name
  }
  depends_on = [ data.aws_ami.ubuntu ]
}