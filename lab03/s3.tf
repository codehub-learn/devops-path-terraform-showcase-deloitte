resource "aws_s3_bucket" "mys3" {
  bucket = "${local.instance_name}-bucket"
  tags = {
    public_bucket = true
  }
}