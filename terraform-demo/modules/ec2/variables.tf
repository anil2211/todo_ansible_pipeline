
variable "instance_config" {
  type = object({
    ami_id = string,
    instance_type = string,
    instance_count = number,
    instance_name = string,
  })
  
}

# variable "ami_id" {
#   type =  string
#   default = "ami-0af9569868786b23a"
#   description = "Tis is the ami id of AL2 in ap-south-1"
# }

# variable "instance_type" {
#   type =  string
#   default = "t2.micro"
#   description = "THis is the instance type of ec2 instance"
# }

# variable "instance_count" {
#     type=number
#     default = 1
#     description = "Number of instance"

# }

# variable "instance_name" {
#   type = string
#   default = "Terraform-created"
#   description = "name of my ec2 instance"
# }

variable "vpc_id" {
  type = string
  
}

variable "subnet_id" {
  type = string
  description = "The subnet ID to launch the instance into"
}


variable "aws_security_group_name" {
  type = string
  default = "Terraform-created-security-group"
  description = "name of my security group"
}

variable "ingress_ports" {
  type = list(number)
  default = [ 22 ,80,443,3002 ]
  description = "this is the list of ports ingress"
}