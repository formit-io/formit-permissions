terraform {
  backend "s3" {}
  required_version = "~> 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.8"
    }
    github = {
      source = "integrations/github"
      version = "~> 4.9.2"
    }
  }
}
