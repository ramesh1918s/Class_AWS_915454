#!/bin/bash

# Create VPC
VPC_ID=$(aws ec2 create-vpc \
  --cidr-block 194.36.0.0/16 \
  --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=AWS_CLI_VPC}]' \
  --query 'Vpc.VpcId' --output text)

# Create Public Subnets
PUB_SUBNET1_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 194.36.0.0/20 --availability-zone us-east-1a \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=AWS_CLI_Public_Subnet_1}]' \
  --query 'Subnet.SubnetId' --output text)

# Create Private Subnets
PRIV_SUBNET1_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 194.36.16.0/20 --availability-zone us-east-1b \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=AWS_CLI_Private_Subnet_1}]' \
  --query 'Subnet.SubnetId' --output text)

PRIV_SUBNET2_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 194.36.32.0/20 --availability-zone us-east-1c \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=AWS_CLI_Private_Subnet_2}]' \
  --query 'Subnet.SubnetId' --output text)

# Enable public IP auto-assign for public subnet
aws ec2 modify-subnet-attribute --subnet-id $PUB_SUBNET1_ID --map-public-ip-on-launch

# Create and attach Internet Gateway
IGW_ID=$(aws ec2 create-internet-gateway \
  --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=AWS_CLI_IGW}]' \
  --query 'InternetGateway.InternetGatewayId' --output text)

aws ec2 attach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID

# Create Public Route Table
PUBLIC_RT_ID=$(aws ec2 create-route-table --vpc-id $VPC_ID \
  --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=AWS_CLI_Public_RT}]' \
  --query 'RouteTable.RouteTableId' --output text)

aws ec2 create-route --route-table-id $PUBLIC_RT_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID

aws ec2 associate-route-table --subnet-id $PUB_SUBNET1_ID --route-table-id $PUBLIC_RT_ID

# Allocate Elastic IP for NAT Gateway
EIP_ALLOC_ID=$(aws ec2 allocate-address --domain vpc \
  --query 'AllocationId' --output text)

# Create NAT Gateway in public subnet
NAT_GW_ID=$(aws ec2 create-nat-gateway \
  --subnet-id $PUB_SUBNET1_ID \
  --allocation-id $EIP_ALLOC_ID \
  --tag-specifications 'ResourceType=natgateway,Tags=[{Key=Name,Value=AWS_CLI_NATGW}]' \
  --query 'NatGateway.NatGatewayId' --output text)

echo "⏳ Waiting for NAT Gateway to become available..."
aws ec2 wait nat-gateway-available --nat-gateway-ids $NAT_GW_ID
echo "✅ NAT Gateway is available."

# Create Private Route Table
PRIVATE_RT_ID=$(aws ec2 create-route-table --vpc-id $VPC_ID \
  --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=AWS_CLI_Private_RT}]' \
  --query 'RouteTable.RouteTableId' --output text)

aws ec2 create-route --route-table-id $PRIVATE_RT_ID --destination-cidr-block 0.0.0.0/0 --nat-gateway-id $NAT_GW_ID

# Associate private subnets to private route table
aws ec2 associate-route-table --subnet-id $PRIV_SUBNET1_ID --route-table-id $PRIVATE_RT_ID
aws ec2 associate-route-table --subnet-id $PRIV_SUBNET2_ID --route-table-id $PRIVATE_RT_ID

# Create Security Group with allow-all rule
SG_ID=$(aws ec2 create-security-group --group-name AWS_CLI_SG --description "Allow all traffic" --vpc-id $VPC_ID \
  --query 'GroupId' --output text)

aws ec2 authorize-security-group-ingress --group-id $SG_ID --protocol -1 --port all --cidr 0.0.0.0/0

# Launch EC2 instance in public subnet
aws ec2 run-instances \
  --image-id ami-084568db4383264d4 \
  --count 1 \
  --instance-type t2.micro \
  --key-name Qalb_Key \
  --security-group-ids $SG_ID \
  --subnet-id $PUB_SUBNET1_ID \
  --associate-public-ip-address \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=AWS_CLI_EC2_Public}]'

# Launch EC2 instance in private subnet
aws ec2 run-instances \
  --image-id ami-084568db4383264d4 \
  --count 1 \
  --instance-type t2.micro \
  --key-name Qalb_Key \
  --security-group-ids $SG_ID \
  --subnet-id $PRIV_SUBNET1_ID \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=AWS_CLI_EC2_Private}]'

echo "✅ EC2 instances launched: one public, one private (with NAT access)."






# To modify your script to include a NAT Gateway that allows private subnets and instances to access the internet (e.g., for software updates), you'll need to:

# Create an Elastic IP (EIP) for the NAT Gateway.

# Launch the NAT Gateway in a public subnet.

# Create a private route table.

# Associate the private subnets with the private route table.

# Add a route to the NAT Gateway in the private route table.

# Below is the modified version of your script with the necessary NAT Gateway additions

