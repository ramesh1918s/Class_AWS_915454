output "vpc_id" {
  value = module.vpc.vpc_id
}

output "sg_id" {
  value = module.sg.sg_id
}

output "instance_id" {
  value = module.ec2.instance_id
}
output "ec2_public_ip" {
  value = module.ec2.public_ip
}
