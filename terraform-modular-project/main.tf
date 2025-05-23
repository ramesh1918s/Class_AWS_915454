provider "aws" {
  region = "ap-south-1"
}

# VPC Module
module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

# Subnet Resource (inside root, not a module for now)
resource "aws_subnet" "NBK_Subnet" {
  vpc_id                  = module.vpc.vpc_id
  cidr_block              = "10.15.0.0/20"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Ram_Subnet1a"
  }
}

# Security Group Module
module "sg" {
  source  = "./modules/sg"
  vpc_id  = module.vpc.vpc_id
  sg_name = var.sg_name
}

# EC2 Module
module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.NBK_Subnet.id
  sg_id         = module.sg.sg_id
  key_name      = var.key_name
  ec2_name      = var.ec2_name
}
#Network module (Internetgateway)

module "network" {
  source    = "./modules/network"
  vpc_id    = module.vpc.vpc_id
  subnet_id = aws_subnet.NBK_Subnet.id
  igw_name  = "NBK_IGW"
  rt_name   = "NBK_RT"
}