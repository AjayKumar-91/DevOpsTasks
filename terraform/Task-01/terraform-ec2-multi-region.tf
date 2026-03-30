# Default region provider
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_west_2"
  region = "us-west-2"
}

# ---------------------------
# VARIABLES
# ---------------------------
variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-0c02fb55956c7d316" # Ubuntu 22.04 LTS for us-east-1 (update for your regions)
}

variable "key_name" {
  default = "my-key" # Replace with your actual key pair name
}

# ---------------------------
# VPCs
# ---------------------------
resource "aws_vpc" "vpc_east" {
  provider = aws.us_east_1
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC-East"
  }
}

resource "aws_vpc" "vpc_west" {
  provider = aws.us_west_2
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "VPC-West"
  }
}

# ---------------------------
# Subnets
# ---------------------------
resource "aws_subnet" "subnet_east" {
  provider = aws.us_east_1
  vpc_id     = aws_vpc.vpc_east.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet_west" {
  provider = aws.us_west_2
  vpc_id     = aws_vpc.vpc_west.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-west-2a"
}

# ---------------------------
# Security Groups
# ---------------------------
resource "aws_security_group" "sg_east" {
  provider = aws.us_east_1
  name   = "sg-east"
  vpc_id = aws_vpc.vpc_east.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_west" {
  provider = aws.us_west_2
  name   = "sg-west"
  vpc_id = aws_vpc.vpc_west.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ---------------------------
# EC2 Instances
# ---------------------------
resource "aws_instance" "instance_east" {
  provider = aws.us_east_1
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet_east.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.sg_east.id]

  tags = {
    Name = "EC2-East"
  }
}

resource "aws_instance" "instance_west" {
  provider = aws.us_west_2
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet_west.id
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.sg_west.id]

  tags = {
    Name = "EC2-West"
  }
}
