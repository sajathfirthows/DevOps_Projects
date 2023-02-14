provider "aws" {
region = "us-east-1"
}

resource "aws_vpc" "default" {
cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
vpc_id = aws_vpc.default.id
cidr_block = "10.0.1.0/24"
}

resource "aws_security_group" "instance" {
name = "instance"
description = "Allow SSH access"
vpc_id = aws_vpc.default.id

ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_key_pair" "new_key_pair" {
key_name = "new-key"
public_key = file("/home/ec2-user/.ssh/authorized_keys")
}


resource "aws_instance" "My-ec2-Instance" {
ami = "ami-0aa7d40eeae50c9a9"
instance_type = "t2.micro"
vpc_security_group_ids = [aws_security_group.instance.id]
subnet_id = aws_subnet.public.id
key_name = aws_key_pair.new_key_pair.key_name
associate_public_ip_address = true
}
