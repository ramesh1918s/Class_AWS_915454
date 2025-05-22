provider "aws" {
  region = "ap-south-1"
}

# 1. VPC
resource "aws_vpc" "Ram_Vpc" {
  cidr_block = "10.15.0.0/16"
  tags = {
    Name = "Ram_Vpc"
  }
}

# 2. Public Subnet
resource "aws_subnet" "Ram_Subnet1a" {
  vpc_id            = aws_vpc.Ram_Vpc.id
  cidr_block        = "10.15.0.0/20"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Ram_Subnet1a"
  }
}

# 3. Private Subnet
resource "aws_subnet" "Ram_Subnet2b" {
  vpc_id            = aws_vpc.Ram_Vpc.id
  cidr_block        = "10.15.16.0/20"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "Ram_Subnet2b"
  }
}

# 4. Internet Gateway
resource "aws_internet_gateway" "Ram_IGW" {
  vpc_id = aws_vpc.Ram_Vpc.id

  tags = {
    Name = "Ram_INGW"
  }
}

# 5. Route Table
resource "aws_route_table" "Ram_RT" {
  vpc_id = aws_vpc.Ram_Vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Ram_IGW.id
  }

  tags = {
    Name = "Ram_RT"
  }
}

# 6. Route Table Association (public subnet)
resource "aws_route_table_association" "Ram_RT_Association" {
  subnet_id      = aws_subnet.Ram_Subnet1a.id
  route_table_id = aws_route_table.Ram_RT.id
}

# 7. Security Group
resource "aws_security_group" "Ram_SG" {
  name        = "Ram_SG"
  description = "Allow ALL traffic (inbound and outbound)"
  vpc_id      = aws_vpc.Ram_Vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"             # All protocols
    cidr_blocks = ["0.0.0.0/0"]    # From anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Ram_SG"
  }
}


# resource "aws_security_group" "Ram_SG" {
#   name        = "Ram_SG"
#   description = "Allow SSH and HTTP"
#   vpc_id      = aws_vpc.Ram_Vpc.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "Ram_SG"
#   }
# }

resource "aws_instance" "My_Server" {
  count         = 2
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.Ram_Subnet1a.id
  key_name      = "Mumbai_Pem_Key"
  vpc_security_group_ids = [aws_security_group.Ram_SG.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF

  tags = {
    Name = "My_Server_${count.index + 1}"
  }
}

resource "aws_instance" "My_Server3" {
  count         = 1
  ami           = "ami-0e35ddab05955cf57"   # Ubuntu AMI in ap-south-1 (change if needed)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.Ram_Subnet1a.id
  key_name      = "Mumbai_Pem_Key"

  vpc_security_group_ids = [aws_security_group.Ram_SG.id]

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
    Name = "My_Netflix_App_Server"
  }
}
