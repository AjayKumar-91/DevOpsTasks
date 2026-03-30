# Configure Providers for 2 Regions

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

# EC2 in Mumbai (ap-south-1)
resource "aws_instance" "mumbai_instance" {
  provider = aws.mumbai

  ami           = "ami-0f5ee92e2d63afc18" # Amazon Linux (Mumbai)
  instance_type = "t2.micro"

  tags = {
    Name = "Mumbai-Instance"
  }
}

# EC2 in Virginia (us-east-1)
resource "aws_instance" "virginia_instance" {
  provider = aws.virginia

  ami           = "ami-0c02fb55956c7d316" # Amazon Linux (Virginia)
  instance_type = "t2.micro"

  tags = {
    Name = "Virginia-Instance"
  }
}
