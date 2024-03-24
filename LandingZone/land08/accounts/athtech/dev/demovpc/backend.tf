terraform {
  backend "s3" {
    bucket         = "codehub-demo-landing-zone"
    dynamodb_table = "codehub-demo-lz-lock"
    key            = "dev/demovpc/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
  }
}
