terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.67.0"
    }
  }
  backend "local" {
    path = "../terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}

