variable "ami_id" {
  type =  string
  default = "ami-0af9569868786b23a"
  description = "Tis is the ami id of AL2 in ap-south-1"
}

variable "instance_type" {
  type =  string
  default = "t2.micro"
  description = "THis is the instance type of ec2 instance"
}

variable "instance_count" {
    type=number
    default = 1
    description = "Number of instance"

}
