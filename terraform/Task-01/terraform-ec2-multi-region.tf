# Provider for Mumbai
provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

# Provider for Virginia
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

# Mumbai Key Pair
resource "aws_key_pair" "mumbai_key" {
  provider   = aws.mumbai
  key_name   = "terra-ec2-key-mumbai"
  public_key = file("terra-ec2-key.pub")
}

# Virginia Key Pair
resource "aws_key_pair" "virginia_key" {
  provider   = aws.virginia
  key_name   = "terra-ec2-key-virginia"
  public_key = file("terra-ec2-key.pub")
}

# Create VPCs in both regions
resource "aws_vpc" "vpc_mumbai" {
  provider   = aws.mumbai
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "mumbai-vpc"
  }
}

resource "aws_vpc" "vpc_virginia" {
  provider   = aws.virginia
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "virginia-vpc"
  }
}

# Subnets
resource "aws_subnet" "subnet_mumbai" {
  provider          = aws.mumbai
  vpc_id            = aws_vpc.vpc_mumbai.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags              = { Name = "mumbai-subnet" }
}

resource "aws_subnet" "subnet_virginia" {
  provider          = aws.virginia
  vpc_id            = aws_vpc.vpc_virginia.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  tags              = { Name = "virginia-subnet" }
}

# Security Groups
resource "aws_security_group" "sg_mumbai" {
  provider    = aws.mumbai
  name        = "mumbai-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.vpc_mumbai.id

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

resource "aws_security_group" "sg_virginia" {
  provider    = aws.virginia
  name        = "virginia-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.vpc_virginia.id

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

# EC2 Instances
resource "aws_instance" "linux_mumbai" {
  provider        = aws.mumbai
  ami             = "ami-06f2f23b8b95143c4" # Amazon Linux 2 in ap-south-1
  instance_type   = "t3.micro"
  subnet_id       = aws_subnet.subnet_mumbai.id
  key_name        = aws_key_pair.mumbai_key.key_name
  security_groups = [aws_security_group.sg_mumbai.id]
  tags            = { Name = "linux-mumbai" }
}

resource "aws_instance" "linux_virginia" {
  provider        = aws.virginia
  ami             = "ami-0dc2d3e4c0f9ebd18" # Amazon Linux 2 in us-east-1
  instance_type   = "t3.micro"
  subnet_id       = aws_subnet.subnet_virginia.id
  key_name        = aws_key_pair.virginia_key.key_name
  security_groups = [aws_security_group.sg_virginia.id]
  tags            = { Name = "linux-virginia" }
}
