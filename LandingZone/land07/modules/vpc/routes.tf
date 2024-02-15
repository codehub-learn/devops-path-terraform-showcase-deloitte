resource "aws_default_route_table" "default_public_route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  tags = merge(
    var.common_tags,
    tomap({
      "Name" = "rtb-public",
      "Classification" = "public"
    })
  )
}


resource "aws_route" "public_default_internet" {
  route_table_id = aws_default_route_table.default_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

## Private route table
resource "aws_route_table" "private" {
  count = length(var.availability_zones)
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.common_tags,
    tomap({
      "Name" = "private-${element(var.availability_zones, count.index)}"
      "Classification" = "private"
    })
  )
}

## Routes for private
resource "aws_route" "private" {
  count = length(var.availability_zones)
  route_table_id = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = element(aws_nat_gateway.nat_gw.*.id, count.index)
}
