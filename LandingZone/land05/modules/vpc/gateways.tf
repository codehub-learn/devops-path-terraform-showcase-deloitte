resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.common_tags,
    tomap({
      "Name" = "${var.vpc_name}-igw-all",
      "Classification" = "public"
    })
  )
}