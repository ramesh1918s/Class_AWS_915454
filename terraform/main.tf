terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0e35ddab05955cf57"  # your AMI
  instance_type = "t2.micro"
  key_name      = "Mumbai_Pem_Key"

  tags = {
    Name = "My_Server"
  }
}
