locals {
  as = toset(var.a)
}

output "name" {
  value = local.as

}