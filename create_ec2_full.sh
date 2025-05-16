#!/bin/bash

# Create VPC
VPC_ID=$(aws ec2 create-vpc \
  --cidr-block 194.36.0.0/16 \
  --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=AWS_CLI_VPC}]' \
  --query 'Vpc.VpcId' --output text)

# Create Subnets
SUBNET1_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 194.36.0.0/20 --availability-zone us-east-1a \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=AWS_CLI_Subnet_1}]' \
  --query 'Subnet.SubnetId' --output text)

SUBNET2_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 194.36.16.0/20 --availability-zone us-east-1b \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=AWS_CLI_Subnet_2}]' \
  --query 'Subnet.SubnetId' --output text)

aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 194.36.32.0/20 --availability-zone us-east-1c \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=AWS_CLI_Subnet_3}]'

aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 194.36.48.0/20 --availability-zone us-east-1a \
  --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=AWS_CLI_Subnet_4}]'

# Enable public IP auto-assign for 2 subnets
aws ec2 modify-subnet-attribute --subnet-id $SUBNET1_ID --map-public-ip-on-launch
aws ec2 modify-subnet-attribute --subnet-id $SUBNET2_ID --map-public-ip-on-launch

# Create and attach Internet Gateway
IGW_ID=$(aws ec2 create-internet-gateway \
  --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=AWS_CLI_INTGW}]' \
  --query 'InternetGateway.InternetGatewayId' --output text)

aws ec2 attach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID

# Create Route Table and associate with 2 subnets
RT_ID=$(aws ec2 create-route-table --vpc-id $VPC_ID \
  --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=AWS_CLI_RT}]' \
  --query 'RouteTable.RouteTableId' --output text)

aws ec2 create-route --route-table-id $RT_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID

aws ec2 associate-route-table --subnet-id $SUBNET1_ID --route-table-id $RT_ID
aws ec2 associate-route-table --subnet-id $SUBNET2_ID --route-table-id $RT_ID

# Create Security Group with allow-all rule
SG_ID=$(aws ec2 create-security-group --group-name AWS_CLI_SG --description "Allow all traffic" --vpc-id $VPC_ID \
  --query 'GroupId' --output text)

aws ec2 authorize-security-group-ingress --group-id $SG_ID --protocol -1 --port all --cidr 0.0.0.0/0

# Launch EC2 instance with public IP
aws ec2 run-instances \
  --image-id ami-084568db4383264d4 \
  --count 1 \
  --instance-type t2.micro \
  --key-name Qalb_Key \
  --security-group-ids $SG_ID \
  --subnet-id $SUBNET1_ID \
  --associate-public-ip-address \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=AWS_CLI_EC2}]'

echo "✅ EC2 Instance 'AWS_CLI_EC2' launched with public IP."
