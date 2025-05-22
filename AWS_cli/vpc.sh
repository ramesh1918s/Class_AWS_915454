#!/bin/bash
export VPC_ID=$(aws ec2 describe-vpcs --filters Name=cidr-block,Values=194.36.0.0/16 --query 'Vpcs[0].VpcId' --output text)
