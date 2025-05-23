# ---------------- Provider for Account A (Default Profile) ----------------
provider "aws" {
  region  = "us-east-1"
  alias   = "account_a"
  profile = "account-a"
}

# ---------------- Provider for Account B (Second Profile) ----------------
provider "aws" {
  region  = "ap-south-1"
  alias   = "account_b"
  profile = "account-b"
}

# ---------------- Security Group (Reusable) ----------------
resource "aws_security_group" "common_sg" {
  provider    = aws.account_a
  name        = "AllowSSHHTTP"
  description = "Allow SSH and HTTP"

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

resource "aws_security_group" "backup_sg" {
  provider    = aws.account_b
  name        = "AllowSSHHTTP"
  description = "Allow SSH and HTTP"

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

# ---------------- EC2 in Account A ----------------
resource "aws_instance" "instance_a" {
  provider               = aws.account_a
  ami                    = "ami-084568db4383264d4"
  instance_type          = "t2.micro"
  key_name               = "Qalb_Key"
  vpc_security_group_ids = [aws_security_group.common_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              # Update packages
              sudo apt-get update -y
              sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

              # Install Docker
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
              sudo apt-get update -y
              sudo apt-get install -y docker-ce

              # Add ubuntu user to docker group (optional, depending on user)
              sudo usermod -aG docker ubuntu

              # Pull your Python/Netflix Docker image (replace with your Docker Hub repo)
              sudo docker pull shivaram1918/netflix:latest

              # Run the container, map port 80
              sudo docker run -d -p 80:80 shivaram1918/netflix:latest
              EOF

  tags = {
    Name = "EC2-Account-A"
  }
}

# ---------------- EC2 in Account B ----------------
resource "aws_instance" "instance_b" {
  provider               = aws.account_b
  ami                    = "ami-0e35ddab05955cf57"
  instance_type          = "t2.micro"
  key_name               = "Key2"
  vpc_security_group_ids = [aws_security_group.backup_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              # Update packages
              sudo apt-get update -y
              sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

              # Install Docker
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
              sudo apt-get update -y
              sudo apt-get install -y docker-ce

              # Add ubuntu user to docker group (optional, depending on user)
              sudo usermod -aG docker ubuntu

              # Pull your Python/Netflix Docker image (replace with your Docker Hub repo)
              sudo docker pull shivaram1918/netflix:latest

              # Run the container, map port 80
              sudo docker run -d -p 80:80 shivaram1918/netflix:latest
              EOF
  tags = {
    Name = "EC2-Account-B"
  }
}
