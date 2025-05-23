variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "igw_name" {
  description = "Internet Gateway name tag"
  type        = string
}

variable "rt_name" {
  description = "Route Table name tag"
  type        = string
}
