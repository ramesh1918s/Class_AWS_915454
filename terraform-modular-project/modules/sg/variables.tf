variable "vpc_id" {
  description = "ID of the VPC where the SG will be created"
  type        = string
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
}
