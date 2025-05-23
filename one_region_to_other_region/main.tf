<<<<<<< HEAD
# Default provider - primary region
=======
# ------------------ Providers ------------------

# Primary Region (us-east-1)
>>>>>>> ded4fdc (tra)
provider "aws" {
  region = "us-east-1"
}

<<<<<<< HEAD
# Secondary provider with alias for backup region
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

# EC2 in primary region
resource "aws_instance" "primary_server" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  tags = {
    Name = "Primary-Server-us-east-1"
  }
}

# EC2 in backup region using aliased provider
resource "aws_instance" "backup_server" {
  provider      = aws.west
  ami           = "ami-0abcdef1234567890"
  instance_type = "t2.micro"
  tags = {
    Name = "Backup-Server-us-west-2"
  }
}



# Why?
# For high availability and disaster recovery, you deploy infrastructure in multiple AWS regions.

# You want to automate this in Terraform, so the same code creates resources in multiple regions.

# How to do in Terraform?
# You use multiple provider blocks with aliases — each configured for a different AWS region.

# Example Project: EC2 in us-east-1 (Primary) and EC2 in us-west-2 (Backup)
=======
# Backup Region (ap-south-1)
provider "aws" {
  alias  = "south"
  region = "ap-south-1"
}

# ------------------ Primary Region Resources ------------------

# 1. VPC
resource "aws_vpc" "Primary_VPC" {
  cidr_block = "10.15.0.0/16"
  tags = {
    Name = "Primary_VPC"
  }
}

# 2. Public Subnet
resource "aws_subnet" "Primary_Subnet1a" {
  vpc_id                  = aws_vpc.Primary_VPC.id
  cidr_block              = "10.15.0.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Primary_Subnet1a"
  }
}

# 3. Private Subnet
resource "aws_subnet" "Primary_Subnet2b" {
  vpc_id            = aws_vpc.Primary_VPC.id
  cidr_block        = "10.15.16.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Primary_Subnet2b"
  }
}

# 4. Internet Gateway
resource "aws_internet_gateway" "Primary_IGW" {
  vpc_id = aws_vpc.Primary_VPC.id

  tags = {
    Name = "Primary_IGW"
  }
}

# 5. Route Table
resource "aws_route_table" "Primary_RT" {
  vpc_id = aws_vpc.Primary_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Primary_IGW.id
  }

  tags = {
    Name = "Primary_RT"
  }
}

# 6. Route Table Association
resource "aws_route_table_association" "Primary_RT_Association" {
  subnet_id      = aws_subnet.Primary_Subnet1a.id
  route_table_id = aws_route_table.Primary_RT.id
}

# 7. Security Group
resource "aws_security_group" "Primary_SG" {
  name        = "Primary_SG"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.Primary_VPC.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Primary_SG"
  }
}

# 8. EC2 Instance
resource "aws_instance" "Primary_Server" {
  ami                    = "ami-04b4f1a9cf54c11d0"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.Primary_Subnet1a.id
  key_name               = "Qalb_Key"
  vpc_security_group_ids = [aws_security_group.Primary_SG.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
              sudo apt-get update -y
              sudo apt-get install -y docker-ce
              sudo usermod -aG docker ubuntu
              sudo docker pull shivaram1918/netflix:latest
              sudo docker run -d -p 80:80 shivaram1918/netflix:latest
              EOF

  tags = {
    Name = "Primary_Server"
  }
}

# ------------------ Backup Region Resources ------------------

# 1. VPC
resource "aws_vpc" "Backup_VPC" {
  provider   = aws.south
  cidr_block = "192.16.0.0/16"

  tags = {
    Name = "Backup_VPC"
  }
}

# 2. Public Subnet
resource "aws_subnet" "Backup_Subnet1a" {
  provider                = aws.south
  vpc_id                  = aws_vpc.Backup_VPC.id
  cidr_block              = "192.16.0.0/20"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Backup_Subnet1a"
  }
}

# 3. Private Subnet
resource "aws_subnet" "Backup_Subnet2b" {
  provider          = aws.south
  vpc_id            = aws_vpc.Backup_VPC.id
  cidr_block        = "192.16.16.0/20"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "Backup_Subnet2b"
  }
}

# 4. Internet Gateway
resource "aws_internet_gateway" "Backup_IGW" {
  provider = aws.south
  vpc_id   = aws_vpc.Backup_VPC.id

  tags = {
    Name = "Backup_IGW"
  }
}

# 5. Route Table
resource "aws_route_table" "Backup_RT" {
  provider = aws.south
  vpc_id   = aws_vpc.Backup_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Backup_IGW.id
  }

  tags = {
    Name = "Backup_RT"
  }
}

# 6. Route Table Association
resource "aws_route_table_association" "Backup_RT_Association" {
  provider       = aws.south
  subnet_id      = aws_subnet.Backup_Subnet1a.id
  route_table_id = aws_route_table.Backup_RT.id
}

# 7. Security Group
resource "aws_security_group" "Backup_SG" {
  provider    = aws.south
  name        = "Backup_SG"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.Backup_VPC.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Backup_SG"
  }
}

# 8. EC2 Instance
resource "aws_instance" "Backup_Server" {
  provider               = aws.south
  ami                    = "ami-0e35ddab05955cf57"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.Backup_Subnet1a.id
  key_name               = "Mumbai_Pem_Key"
  vpc_security_group_ids = [aws_security_group.Backup_SG.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
              sudo apt-get update -y
              sudo apt-get install -y docker-ce
              sudo usermod -aG docker ubuntu
              sudo docker pull shivaram1918/netflix:latest
              sudo docker run -d -p 80:80 shivaram1918/netflix:latest
              EOF

  tags = {
    Name = "Backup_Server"
  }
}
>>>>>>> ded4fdc (tra)
