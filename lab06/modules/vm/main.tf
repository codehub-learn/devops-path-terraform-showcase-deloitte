locals {
  public_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/0HCXa5vQUU+zfvLIJfSrubPZ8fKS4CkLgkXW2cHGVNhROssVLnOBHgSRgFm6jUQ9DVeNXQXKdRiM/Hfb5j5d77/FSZC17p/d6FXgve/1T12qI8j3TcNuU7t4EKuW0XP+dfPRP/ge/lNubzngLeRP0eCXNhjcCgQ7NM0//YRT24fgNqaL/NtcMlNJCSNLdQ6fMghFPet+ZKlRaFBask7tTlohW6mVZV9ECoW8yUfRhNpToS/GBsNBCXF/p2MuVbhHPF9+yvMbvVCqQI8MOQh8y1xe7ByZ6Btrq/OP7xL3ky2iWFLRjrLOjCHflUrL7+z3vAb6egWjo1cKqCvSOhDnirpFGBTUzgOha4JNDZsbDM3HoH5Slt2g2LAJFpxiFtqTB3sATkeHV0A2qCFYlbR6qPLVyzk8yAlW+IGFOQLt1nhjlkeV8CPPBwUDcnfwXjktY/FksayFIvhZ4Y95E5W0r4njrfmecFMALLuQeQC0plfBsWjROZzmaqLHs6E+538= kostas@HPZ600"
}

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
 instance_name = var.instance_name
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
              echo "${local.public_ssh_key}" >> /home/admin/.ssh/authorized_keys
              EOF
  tags = {
    Name = var.instance_name
  }
  depends_on = [ data.aws_ami.ubuntu ]
}

check "health_check" {
  data "http" "instance_web" {
    url = "http://${aws_instance.instance.public_dns}:8080"
  }

  assert {
    condition = data.http.instance_web.status_code == 200
    error_message = "${data.http.instance_web.url} returned an unhealthy status code"
  }
}
