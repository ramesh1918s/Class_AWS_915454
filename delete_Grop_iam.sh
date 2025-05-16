#!/bin/bash

# Remove the user from the group
aws iam remove-user-from-group --user-name ntr2 --group-name Admins

# Detach any managed policies from the group
aws iam detach-group-policy \
  --group-name Admins \
  --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
  
# Delete the group

aws iam delete-group --group-name Admins

# Delete access keys of the user (required before deletion)

aws iam list-access-keys --user-name ntr2

aws iam delete-access-key --user-name ntr2 --access-key-id <ACCESS_KEY_ID>

# Detach any managed policies from the user (if any)

aws iam detach-user-policy \
  --user-name ntr2 \
  --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

# Delete the user
aws iam delete-user --user-name ntr2
