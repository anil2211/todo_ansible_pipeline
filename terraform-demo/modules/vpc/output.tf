output "vpc_id" {
  value = aws_vpc.terraform_created_vpc.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}
