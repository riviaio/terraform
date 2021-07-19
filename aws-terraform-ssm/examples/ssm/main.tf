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

}

module "aws_ssm_parameter"  {
  source            = "../../modules/ssm/"
  name              = "/production/database/password/master"
  value             = "password123!"
  description       = "This is example."
  tier              = "Standard"
  key_id            = "alias/exampleAlias"
  overwrite         = true
  allowed_pattern   = ""
  data_type         = "text"
  # tags = {
  #   environment = "production"
  # }
}