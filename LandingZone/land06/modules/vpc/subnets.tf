resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.public_subnet_az
  tags = merge(
    var.common_tags,
    tomap({
      "classification" = "public",
      "Name"           = "public-subnet"
    })
  )
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_default_route_table.default_public_route_table.id
}