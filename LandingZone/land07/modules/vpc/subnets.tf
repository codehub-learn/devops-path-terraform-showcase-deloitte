resource "aws_subnet" "public_subnet" {
  count = length(var.availability_zones)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnets_cidrs["public"][count.index]
  availability_zone = element(var.availability_zones, count.index)
  tags = merge(
    var.common_tags,
    tomap({
      "classification" = "public",
      "Name"           = "public-${count.index}"
    })
  )
}

resource "aws_route_table_association" "public" {
  count = length(var.availability_zones)
  subnet_id = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = element(aws_default_route_table.default_public_route_table.*.id, count.index)
}

resource "aws_subnet" "private_subnet" {
  count = length(var.availability_zones)
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnets_cidrs["private"][count.index]
  availability_zone = element(var.availability_zones, count.index)
  tags = merge(
    var.common_tags,
    tomap({
      "Classification" = "private",
      "Name" = "private-${element(var.availability_zones.*, count.index)}"
    })
  )
}

resource "aws_route_table_association" "private" {
  count = length(var.availability_zones)
  subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

