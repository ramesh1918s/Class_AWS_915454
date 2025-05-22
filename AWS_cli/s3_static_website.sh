#!/bin/bash

BUCKET_NAME="ram-bucket-devops-3"
FOLDER_NAME="Koppee"

# 1. Create S3 bucket
aws s3api create-bucket \
  --bucket $BUCKET_NAME \
  --region ap-south-1 \
  --create-bucket-configuration LocationConstraint=ap-south-1

# 2. Block public access OFF (so we can allow public)
aws s3api put-public-access-block \
  --bucket $BUCKET_NAME \
  --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false

# 3. Set Bucket Policy to allow public read
cat > s3_public_policy.json <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "PublicReadGetObject",
    "Effect": "Allow",
    "Principal": "*",
    "Action": "s3:GetObject",
    "Resource": "arn:aws:s3:::$BUCKET_NAME/*"
  }]
}
EOF

aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy file://s3_public_policy.json

# 4. Enable static website hosting
aws s3 website s3://$BUCKET_NAME/ \
  --index-document index.html \
  --error-document error.html

# 5. Sync your folder to the bucket and make it public
aws s3 sync $FOLDER_NAME s3://$BUCKET_NAME/ --acl public-read

# 6. Show website URL
echo "✅ S3 static website deployed successfully!"
echo "🌐 URL: http://$BUCKET_NAME.s3-website.ap-south-1.amazonaws.com"
