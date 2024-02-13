resource "aws_s3_bucket" "mys3" {
  bucket = var.bucket_name
  tags = {
    public_bucket = true
  }
}