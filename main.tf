provider "aws" {
  region = var.aws_region
}

#Create security group with firewall rules
resource "aws_security_group" "webSG1" {
  name        = "webSG1"
  description = "Allow ssh  inbound traffic"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

# Create AWS ec2 instance
resource "aws_instance" "myFirstInstance" {
  ami           = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.webSG1.id}"]
  tags = {
    Name = "Window_VPN"
  }
}

# Create Elastic IP address
resource "aws_eip" "myFirstInstance" {
 domain   = "vpc"
 instance = aws_instance.myFirstInstance.id
tags= {
    Name = "my_elastic_ip"
  }
}
