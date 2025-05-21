provider "aws" {
    region = "ap-south-1"
}

module "WebServer" {
  source = "./modules/ec2"
  instance_count = 1
  instance_name = "Terraform launch ec2"
}

# resource "aws_instance" "terraform-ec2" {
#     # ami= "ami-0af9569868786b23a"
#     ami = var.ami_id
#     # instance_type = "t2.micro"
#     instance_type = var.instance_type
#     # count = 1
#     count = var.instance_count
#     tags = {
#         Name = "Terraform-EC2"
#     }
# }

resource "aws_s3_bucket" "example" {
  bucket = "my-anil-tf-bucket"
  tags = {
    name = "my bucket"
    Environment = " Dev "
  }
}


# resource "aws_security_group" "sg_example" {
#  name = "terraform_allow_group"
#  description = "Allow traffic to ec2 instance"
  
#   ingress {
#     from_port        = 8080
#     to_port          = 8080
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     name = "allow traffic from terraform"
#   }
# }

terraform {
  backend "s3" {
    bucket = "my-anil-tf-bucket"
    region = "ap-south-1"
  }
}