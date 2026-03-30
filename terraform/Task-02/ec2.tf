# -------------------------
# Security Group (common for both regions)
# -------------------------

resource "aws_security_group" "allow_http_mumbai" {
  provider    = aws.mumbai
  name        = "allow_http_mumbai"
  description = "Allow HTTP and SSH in Mumbai"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_security_group" "allow_http_virginia" {
  provider    = aws.virginia
  name        = "allow_http_virginia"
  description = "Allow HTTP and SSH in Virginia"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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

# -------------------------
# EC2 in Mumbai
# -------------------------
resource "aws_instance" "mumbai_instance" {
  provider = aws.mumbai

  ami           = "ami-0f5ee92e2d63afc18" # Ubuntu Mumbai
  instance_type = "t2.micro"
  key_name      = "terra-auto-key"

  vpc_security_group_ids = [aws_security_group.allow_http_mumbai.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "Mumbai-Nginx-Server"
  }
}

# -------------------------
# EC2 in Virginia
# -------------------------
resource "aws_instance" "virginia_instance" {
  provider = aws.virginia

  ami           = "ami-0c02fb55956c7d316" # Ubuntu Virginia
  instance_type = "t2.micro"
  key_name      = "terra-auto-key"

  vpc_security_group_ids = [aws_security_group.allow_http_virginia.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "Virginia-Nginx-Server"
  }
}
