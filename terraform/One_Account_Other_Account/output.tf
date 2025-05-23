output "Account_A_EC2_Public_IP" {
  value = aws_instance.instance_a.public_ip
}

output "Account_A_EC2_Public_DNS" {
  value = aws_instance.instance_a.public_dns
}

output "Account_B_EC2_Public_IP" {
  value = aws_instance.instance_b.public_ip
}

output "Account_B_EC2_Public_DNS" {
  value = aws_instance.instance_b.public_dns
}
