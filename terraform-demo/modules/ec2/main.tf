resource "aws_instance" "terraform-ec2" {
    # ami= "ami-0af9569868786b23a"
    ami = var.instance_config.ami_id
    # instance_type = "t2.micro"
    instance_type = var.instance_config.instance_type
    # count = 1
    count = var.instance_config.instance_count
    tags = {
        Name = var.instance_config.instance_name
    }
    
    vpc_security_group_ids = [aws_security_group.sg_example.id]
    subnet_id = var.subnet_id
    key_name = "ansible_demo"

    connection {
      type   = "ssh"
      host   = self.public_ip
      user   = "ec2-user"

      private_key = file("D:/devops_practise/1pw_practise/Todo-appFinal/todo-app/ansible_demo.pem")
    }

    provisioner "remote-exec" {
      inline = [
        "sudo yum update -y",
        "sudo yum install -y nginx",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx"
      ]
      
    }


}

resource "aws_security_group" "sg_example" {
 name = var.aws_security_group_name
 description = "Allow traffic to ec2 instance"
 vpc_id = var.vpc_id
  
  dynamic "ingress" {
   for_each = var.ingress_ports
   content {
     from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
   }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    name = "allow traffic from terraform"
  }
}