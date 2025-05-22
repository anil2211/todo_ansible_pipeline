provider "aws" {
    region = "ap-south-1"
}


module "TerraformVPC" {
  source = "./modules/vpc"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = true
  }

  subnet_config = {
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true
  }
}

module "WebServer" {
  source = "./modules/ec2"
  instance_config = {
  ami_id= var.instance_config.ami_id
  instance_count= var.instance_config.instance_count
  instance_type= var.instance_config.instance_type
  instance_name= "WebServer-${var.instance_config.instance_name}"
  }
  # aws_security_group_name= var.aws_security_group_name
  aws_security_group_name = "WebServer-${terraform.workspace}-sg"
  vpc_id = module.TerraformVPC.vpc_id
  subnet_id = module.TerraformVPC.subnet_id
  
}

module "BackendServer" {
  source = "./modules/ec2"
  instance_config = {
    ami_id= var.instance_config.ami_id
  instance_count= var.instance_config.instance_count
  instance_type= var.instance_config.instance_type
  instance_name= "backendServer-${var.instance_config.instance_name}"
  }
  # aws_security_group_name= var.aws_security_group_name
  aws_security_group_name = "BackendServer-${terraform.workspace}-sg"
  vpc_id = module.TerraformVPC.vpc_id
  subnet_id = module.TerraformVPC.subnet_id
}

resource "aws_sns_topic" "alarms" {
  name =  "${terraform.workspace}-alarms"
  
}


module "WebServer_cpu_alarms" {
 source = "./modules/cloudwatch"  
 count = var.environment =="dev" ? var.instance_config.instance_count : 0 
 alarm_config = {
    alarm_name = "${terraform.workspace}-webServer-high-cpu-${count.index +1}"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods = 5
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = 30
    statistic = "Average"
    threshold = 5
    alarm_description = "This is test monitor devresources"
    alarm_actions = [aws_sns_topic.alarms.arn]
    dimensions = {
      InstanceId = module.WebServer.instance_id[count.index]

    }
 }
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

# resource "aws_s3_bucket" "example" {
#   bucket = "my-anil-tf-bucket-1"
#   tags = {
#     name = "my bucket"
#     Environment = " Dev "
#   }
# }


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

# terraform {
#   backend "s3" {
#     bucket = "my-anil-tf-bucket"
#     region = "ap-south-1"
#   }
# }