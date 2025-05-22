#!/bin/bash


# Wait for NAT Gateway deletion
echo "⏳ Waiting for NAT Gateway to be deleted (can take ~2 mins)..."
aws ec2 wait nat-gateway-deleted --nat-gateway-ids $nat --region $REGION
echo "✅ NAT Gateway deleted."

# Release EIP used by NAT Gateway
EIP_ALLOC_IDS=$(aws ec2 describe-addresses \
  --query "Addresses[?Tags[?Key=='Name' && Value=='AWS_CLI_NAT_EIP']].AllocationId" \
  --output text --region $REGION)

if [ -z "$EIP_ALLOC_IDS" ]; then
  # Try alternate logic if EIP not tagged
  EIP_ALLOC_IDS=$(aws ec2 describe-addresses \
    --query "Addresses[?AssociationId==null].AllocationId" \
    --output text --region $REGION)
fi

for alloc in $EIP_ALLOC_IDS; do
  echo "📤 Releasing EIP Allocation: $alloc"
  aws ec2 release-address --allocation-id $alloc --region $REGION
done
