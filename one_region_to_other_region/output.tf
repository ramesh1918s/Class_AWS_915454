# ------------------ Primary Region Outputs ------------------

output "Primary_VPC_ID" {
  value = aws_vpc.Primary_VPC.id
}

output "Primary_Public_Subnet_ID" {
  value = aws_subnet.Primary_Subnet1a.id
}

output "Primary_Private_Subnet_ID" {
  value = aws_subnet.Primary_Subnet2b.id
}

output "Primary_EC2_Public_IP" {
  value = aws_instance.Primary_Server.public_ip
}

output "Primary_EC2_Public_DNS" {
  value = aws_instance.Primary_Server.public_dns
}


# ------------------ Backup Region Outputs ------------------

output "Backup_VPC_ID" {
  value = aws_vpc.Backup_VPC.id
}

output "Backup_Public_Subnet_ID" {
  value = aws_subnet.Backup_Subnet1a.id
}

output "Backup_Private_Subnet_ID" {
  value = aws_subnet.Backup_Subnet2b.id
}

output "Backup_EC2_Public_IP" {
  value = aws_instance.Backup_Server.public_ip
}

output "Backup_EC2_Public_DNS" {
  value = aws_instance.Backup_Server.public_dns
}
