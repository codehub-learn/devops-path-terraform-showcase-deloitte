output "security_group_id" {
    value = aws_security_group.instance_sg.id
    description = "ID Of security group"
}