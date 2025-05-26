
provider "aws" {
  region = var.aws_region
}

# terraform {
#   backend "s3" {
#     bucket = "anil-terraform-state-bucket01"
#     key = "terraform.tfstate"
#     region = "ap-south-1"
#   }
# }