terraform {
  backend "s3" {
    bucket         = "demovpc-periklis-codehub-demo"
    dynamodb_table = "demovpc-periklis-codehub-demo"
    key            = "periklis/app01/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
  }
}