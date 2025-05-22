#!/bin/bash

aws iam create-user --user-name ntr2
aws iam attach-user-policy \
  --user-name ntr2 \
  --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
aws iam create-access-key --user-name ntr2

