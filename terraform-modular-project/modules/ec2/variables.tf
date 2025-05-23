variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
}

variable "sg_id" {
  description = "Security group ID to attach"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "ec2_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}
