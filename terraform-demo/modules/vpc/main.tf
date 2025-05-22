resource "aws_vpc" "terraform_created_vpc" {
    cidr_block =  var.vpc_config.cidr_block
    instance_tenancy = var.vpc_config.instance_tenancy
    enable_dns_hostnames = var.vpc_config.enable_dns_hostnames

    tags = {
      Name = "terraform-created-vpc"
    }
  
}

resource "aws_subnet" "main" {
  vpc_id = aws_vpc.terraform_created_vpc.id
  cidr_block = var.subnet_config.cidr_block
  availability_zone = var.subnet_config.availability_zone
  map_public_ip_on_launch = var.subnet_config.map_public_ip_on_launch
  tags = {
    Name = "Main subnet"
  }
}

resource "aws_internet_gateway" "terraform-gw" {
  vpc_id = aws_vpc.terraform_created_vpc.id
  tags = {
    Name = "terraform gateway"
  }
}
resource "aws_route_table" "terraform-aws_route_table" {
  vpc_id =  aws_vpc.terraform_created_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-gw.id
  }
  tags = {
    Name = "terraform route table"
  }
}


resource "aws_route_table_association" "terraform-rt-association" {
  
  subnet_id = aws_subnet.main.id
  route_table_id = aws_route_table.terraform-aws_route_table.id
}