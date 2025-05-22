variable "vpc_config" {
  type = object({
    cidr_block = string
    instance_tenancy= string
    enable_dns_hostnames = bool
  })
}

variable "subnet_config" {
  type = object({
    cidr_block = string
    availability_zone = string
    map_public_ip_on_launch = bool
  })
}