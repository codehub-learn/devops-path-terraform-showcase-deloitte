resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.public_subnet_az
  tags = merge(
    var.common_tags,
    tomap({
      "classification" = "public",
      "name"           = "public-subnet"
    })
  )
}

