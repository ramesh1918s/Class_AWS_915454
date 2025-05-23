output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.NBK_EC2.id
}
output "public_ip" {
  value = aws_instance.NBK_EC2.public_ip
}
