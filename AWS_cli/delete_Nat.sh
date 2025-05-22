#!/bin/bash

REGION="us-east-1"
VPC_NAME="AWS_CLI_VPC"

VPC_ID=$(aws ec2 describe-vpcs \
  --filters "Name=tag:Name,Values=$VPC_NAME" \
  --query "Vpcs[0].VpcId" --output text --region $REGION)

if [ "$VPC_ID" == "None" ]; then
  echo "❌ No VPC found with tag Name=$VPC_NAME"
  exit 1
fi

echo "🔍 Found VPC: $VPC_ID"

# Terminate EC2 instances
INSTANCE_IDS=$(aws ec2 describe-instances --filters "Name=vpc-id,Values=$VPC_ID" \
  --query "Reservations[].Instances[].InstanceId" --output text --region $REGION)
if [ ! -z "$INSTANCE_IDS" ]; then
  echo "⚠️ Terminating EC2 instances: $INSTANCE_IDS"
  aws ec2 terminate-instances --instance-ids $INSTANCE_IDS --region $REGION
  aws ec2 wait instance-terminated --instance-ids $INSTANCE_IDS --region $REGION
fi

# Delete NAT Gateways
NAT_IDS=$(aws ec2 describe-nat-gateways --filter Name=vpc-id,Values=$VPC_ID \
  --query "NatGateways[].NatGatewayId" --output text --region $REGION)
for nat in $NAT_IDS; do
  echo "🧨 Deleting NAT Gateway: $nat"
  aws ec2 delete-nat-gateway --nat-gateway-id $nat --region $REGION
done

# Wait for NAT Gateway deletion
echo "⏳ Waiting for NAT Gateways to delete..."
sleep 60

# Release Elastic IPs
EIP_ALLOC_IDS=$(aws ec2 describe-addresses \
  --query "Addresses[?AssociationId!=null].AllocationId" --output text --region $REGION)
for alloc in $EIP_ALLOC_IDS; do
  echo "📤 Releasing EIP: $alloc"
  aws ec2 release-address --allocation-id $alloc --region $REGION
done

# Detach and delete Internet Gateway
IGW_ID=$(aws ec2 describe-internet-gateways --filters "Name=attachment.vpc-id,Values=$VPC_ID" \
  --query "InternetGateways[0].InternetGatewayId" --output text --region $REGION)

if [ "$IGW_ID" != "None" ]; then
  echo "🔌 Detaching IGW: $IGW_ID"
  aws ec2 detach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID --region $REGION
  aws ec2 delete-internet-gateway --internet-gateway-id $IGW_ID --region $REGION
fi

# Disassociate and delete Route Tables
ROUTE_TABLE_IDS=$(aws ec2 describe-route-tables --filters "Name=vpc-id,Values=$VPC_ID" \
  --query "RouteTables[].RouteTableId" --output text --region $REGION)
for rt in $ROUTE_TABLE_IDS; do
  ASSOC_IDS=$(aws ec2 describe-route-tables --route-table-ids $rt \
    --query "RouteTables[0].Associations[?Main==\`false\`].RouteTableAssociationId" \
    --output text --region $REGION)
  
  for assoc in $ASSOC_IDS; do
    echo "🔓 Disassociating Route Table: $assoc"
    aws ec2 disassociate-route-table --association-id $assoc --region $REGION
  done
  
  echo "🗑️ Deleting Route Table: $rt"
  aws ec2 delete-route-table --route-table-id $rt --region $REGION
done

# Delete Subnets
SUBNET_IDS=$(aws ec2 describe-subnets --filters "Name=vpc-id,Values=$VPC_ID" \
  --query "Subnets[].SubnetId" --output text --region $REGION)
for subnet in $SUBNET_IDS; do
  echo "🗑️ Deleting Subnet: $subnet"
  aws ec2 delete-subnet --subnet-id $subnet --region $REGION
done

# Delete custom Security Groups (not 'default')
SG_IDS=$(aws ec2 describe-security-groups --filters "Name=vpc-id,Values=$VPC_ID" \
  --query "SecurityGroups[?GroupName!='default'].GroupId" --output text --region $REGION)
for sg in $SG_IDS; do
  echo "🛡️ Deleting Security Group: $sg"
  aws ec2 delete-security-group --group-id $sg --region $REGION
done

# Finally, delete the VPC
echo "🧨 Deleting VPC: $VPC_ID"
aws ec2 delete-vpc --vpc-id $VPC_ID --region $REGION

echo "✅ All AWS CLI-created resources have been cleaned up."







































# # Set your AWS region
# REGION="us-east-1"

# # Find the VPC by tag
# VPC_ID=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=AWS_CLI_VPC" --query "Vpcs[0].VpcId" --output text --region $REGION)

# if [ "$VPC_ID" == "None" ]; then
#   echo "No matching VPC found. Exiting."
#   exit 1
# fi

# echo "Found VPC: $VPC_ID"

# # Terminate EC2 Instances
# INSTANCE_IDS=$(aws ec2 describe-instances --filters "Name=vpc-id,Values=$VPC_ID" --query "Reservations[].Instances[].InstanceId" --output text --region $REGION)
# if [ ! -z "$INSTANCE_IDS" ]; then
#   echo "Terminating EC2 Instances: $INSTANCE_IDS"
#   aws ec2 terminate-instances --instance-ids $INSTANCE_IDS --region $REGION
#   aws ec2 wait instance-terminated --instance-ids $INSTANCE_IDS --region $REGION
# fi

# # Delete NAT Gateway
# NAT_GW_IDS=$(aws ec2 describe-nat-gateways --filter Name=vpc-id,Values=$VPC_ID --query "NatGateways[].NatGatewayId" --output text --region $REGION)
# for natgw in $NAT_GW_IDS; do
#   echo "Deleting NAT Gateway: $natgw"
#   aws ec2 delete-nat-gateway --nat-gateway-id $natgw --region $REGION
# done
# # NAT GW deletion can take time, so consider sleeping or polling here.

# # Release Elastic IPs
# EIP_ALLOC_IDS=$(aws ec2 describe-addresses --query "Addresses[?Tags[?Key=='Name' && Value=='AWS_CLI_NATGW']].AllocationId" --output text --region $REGION)
# for alloc in $EIP_ALLOC_IDS; do
#   echo "Releasing EIP: $alloc"
#   aws ec2 release-address --allocation-id $alloc --region $REGION
# done

# # Detach and Delete Internet Gateway
# IGW_ID=$(aws ec2 describe-internet-gateways --filters "Name=attachment.vpc-id,Values=$VPC_ID" --query "InternetGateways[0].InternetGatewayId" --output text --region $REGION)
# if [ "$IGW_ID" != "None" ]; then
#   echo "Detaching and deleting IGW: $IGW_ID"
#   aws ec2 detach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID --region $REGION
#   aws ec2 delete-internet-gateway --internet-gateway-id $IGW_ID --region $REGION
# fi

# # Delete route tables (excluding main route table)
# ROUTE_TABLES=$(aws ec2 describe-route-tables --filters "Name=vpc-id,Values=$VPC_ID" --query "RouteTables[?Associations[?Main==\`false\`]].RouteTableId" --output text --region $REGION)
# for rt in $ROUTE_TABLES; do
#   echo "Deleting Route Table: $rt"
#   aws ec2 delete-route-table --route-table-id $rt --region $REGION
# done

# # Delete subnets
# SUBNET_IDS=$(aws ec2 describe-subnets --filters "Name=vpc-id,Values=$VPC_ID" --query "Subnets[].SubnetId" --output text --region $REGION)
# for subnet in $SUBNET_IDS; do
#   echo "Deleting Subnet: $subnet"
#   aws ec2 delete-subnet --subnet-id $subnet --region $REGION
# done

# # Delete security groups (except default)
# SG_IDS=$(aws ec2 describe-security-groups --filters "Name=vpc-id,Values=$VPC_ID" --query "SecurityGroups[?GroupName!='default'].GroupId" --output text --region $REGION)
# for sg in $SG_IDS; do
#   echo "Deleting Security Group: $sg"
#   aws ec2 delete-security-group --group-id $sg --region $REGION
# done

# # Finally, delete the VPC
# echo "Deleting VPC: $VPC_ID"
# aws ec2 delete-vpc --vpc-id $VPC_ID --region $REGION

# echo "✅ All AWS CLI-created resources deleted."
