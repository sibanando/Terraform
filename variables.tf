variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1b"
}

variable "key_name" {
  description = " SSH keys to connect to ec2 instance"
  default     =  "my-d"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     =  "t2.micro"
}

variable "security_group" {
  description = "Name of security group"
  default     = "webSG"
}

variable "tag_name" {
  description = "Tag Name of for Ec2 instance"
  default     = "my-ec2-01"
}

variable "ami_id" {
  description = "AMI for Ubuntu Ec2 instance"
  default     = "ami-0fc682b2a42e57ca2"
}
