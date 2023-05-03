provider "aws" {         #other providers available as well in the docs
  region = "us-east-1"   #you can choose the region you're at

  default_tags {
    tags = {
    Terraform = "yes"
    Owner     = "Name"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.45"
    }
  }
}
