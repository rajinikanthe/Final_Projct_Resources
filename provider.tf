terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.17.0"
    }
}
    backend "s3" {
      bucket = "potureddyhari-capstone-project"
      key    = "root/terraform.tfstate "
      region = "us-east-1"
   }
}
provider "aws" {
  # Configuration options
        region= "us-east-1"
}
