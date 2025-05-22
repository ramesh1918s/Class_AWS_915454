#!/bin/bash

# Variables
CIDR_BLOCK="10.0.0.0/16"
VPC_NAME="Ram_Vpc"

# Step 1: Create VPC
VPC_ID=$(aws ec2 create-vpc \
    --cidr-block $CIDR_BLOCK \
    --output text \
    --query 'Vpc.VpcId')

echo "VPC created with ID: $VPC_ID"

# Step 2: Tag the VPC
aws ec2 create-tags \
    --resources $VPC_ID \
    --tags Key=Name,Value=$VPC_NAME

echo "VPC tagged as $VPC_NAME"

# Step 3: Enable DNS support (optional)
aws ec2 modify-vpc-attribute \
    --vpc-id $VPC_ID \
    --enable-dns-support "{\"Value\":true}"

aws ec2 modify-vpc-attribute \
    --vpc-id $VPC_ID \
    --enable-dns-hostnames "{\"Value\":true}"

echo "DNS support and hostnames enabled for VPC $VPC_ID"
