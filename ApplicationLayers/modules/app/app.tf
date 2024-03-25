module "instance" {
  source                    = "../ec2"
  count                     = length(data.aws_availability_zones.available.names)
  ami_id                    = data.aws_ami.debian.id
  instance_type             = "t3.micro"
  subnet_id                 = data.aws_subnets.private.ids[count.index]
  security_group_ids        = [aws_security_group.app_security_group.id]
  user_data              = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              echo "<html>" > /var/www/html/index.html
              echo "<head><title>Terraform Demo</title></head>" >> /var/www/html/index.html
              echo "<body>" >> /var/www/html/index.html
              echo "<h3>Hello from ${var.application_name}-${count.index}</h3>" >> /var/www/html/index.html
              echo "</body></html>" >> /var/www/html/index.html
              systemctl restart apache2
              EOF
  common_tags = merge(
    var.common_tags,
    tomap({
      "Name" = "${var.application_name}-${count.index}",
      "Classification" = "private"
    })
  )
}

resource "aws_lb_target_group_attachment" "alb_tg_attachment" {
  count            = length(data.aws_availability_zones.available.names)
  target_group_arn = module.loadbalancer.target_group_arn
  target_id        = module.instance[count.index].instance_id
}
