#!/bin/bash



#create one user add access_key add ploicie

aws iam create-user --user-name ntr2
aws iam attach-user-policy \
  --user-name ntr2 \
  --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
aws iam create-access-key --user-name ntr2


# create a group add user 

aws iam create-group --group-name Admins

aws iam attach-group-policy \
  --group-name Admins \
  --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

aws iam add-user-to-group --user-name ntr2 --group-name Admins

aws iam get-group --group-name Admins


