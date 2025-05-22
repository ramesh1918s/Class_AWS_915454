#!/bin/bash

echo "🔎 Fetching EC2 instance ID..."
INSTANCE_ID=$(aws ec2 describe-instances \
  --filters Name=tag:Name,Values=AWS_CLI_EC2 \
  --query 'Reservations[].Instances[].InstanceId' --output text)

if [ "$INSTANCE_ID" != "None" ]; then
  echo "🛑 Terminating EC2 instance: $INSTANCE_ID"
  aws ec2 terminate-instances --instance-ids $INSTANCE_ID
  aws ec2 wait instance-terminated --instance-ids $INSTANCE_ID
  echo "✅ EC2 instance terminated."
fi

echo "🔎 Fetching VPC ID..."
VPC_ID=$(aws ec2 describe-vpcs \
  --filters Name=cidr-block,Values=194.36.0.0/16 \
  --query 'Vpcs[0].VpcId' --output text)

echo "🔎 Fetching IGW ID..."
IGW_ID=$(aws ec2 describe-internet-gateways \
  --filters Name=attachment.vpc-id,Values=$VPC_ID \
  --query 'InternetGateways[0].InternetGatewayId' --output text)

echo "🔌 Detaching and deleting Internet Gateway..."
aws ec2 detach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID
aws ec2 delete-internet-gateway --internet-gateway-id $IGW_ID

echo "🔎 Fetching Route Table ID..."
RT_ID=$(aws ec2 describe-route-tables \
  --filters Name=vpc-id,Values=$VPC_ID Name=tag:Name,Values=AWS_CLI_RT \
  --query 'RouteTables[0].RouteTableId' --output text)

echo "🧹 Disassociating and deleting Route Table..."
ASSOC_IDS=$(aws ec2 describe-route-tables --route-table-ids $RT_ID \
  --query "RouteTables[0].Associations[*].RouteTableAssociationId" --output text)
for assoc in $ASSOC_IDS; do
  aws ec2 disassociate-route-table --association-id $assoc
done
aws ec2 delete-route-table --route-table-id $RT_ID

echo "🧨 Deleting Subnets..."
SUBNET_IDS=$(aws ec2 describe-subnets \
  --filters Name=vpc-id,Values=$VPC_ID \
  --query 'Subnets[*].SubnetId' --output text)
for subnet in $SUBNET_IDS; do
  aws ec2 delete-subnet --subnet-id $subnet
done

echo "🛡️ Deleting Security Group..."
SG_ID=$(aws ec2 describe-security-groups \
  --filters Name=group-name,Values=AWS_CLI_SG \
  --query "SecurityGroups[0].GroupId" --output text)
aws ec2 delete-security-group --group-id $SG_ID

echo "🧱 Deleting VPC..."
aws ec2 delete-vpc --vpc-id $VPC_ID

echo "✅ All AWS CLI resources destroyed successfully."
