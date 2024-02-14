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