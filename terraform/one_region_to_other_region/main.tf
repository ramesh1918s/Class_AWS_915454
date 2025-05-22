# Default provider - primary region
provider "aws" {
  region = "us-east-1"
}

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