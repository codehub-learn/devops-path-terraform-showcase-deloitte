terraform {
  backend "s3" {
    bucket         = "demovpc-alin-codehub-demo"
    dynamodb_table = "demovpc-alin-codehub-demo"
    key            = "alin/app01/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
  }
}