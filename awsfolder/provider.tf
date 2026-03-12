terraform {
  required_version = "~> 1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "theresiaweb.com"
    key    = "prod/terraform.tfstate"
    region = "us-east-2"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-2"
}


