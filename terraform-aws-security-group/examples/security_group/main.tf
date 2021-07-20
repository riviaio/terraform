terraform {
  required_providers {
    aws  = {
      source  = "hashicorp/aws"
      version = "~> 3.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIA22RS3MD6FZ7L4SEK"
  secret_key = "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"
}

module "map" {
  source            = "../../modules/security-group/"
}