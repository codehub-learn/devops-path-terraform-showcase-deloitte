terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.45"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }

  }
  required_version = ">= 1.1"
}