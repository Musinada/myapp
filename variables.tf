variable "region" {
  default     = "ap-south-1"
  description = "AWS region"
}

variable "ssh_key" {
  description = "ssh-key to login to the instances"
  default = ""
}

variable "subnets" {
  description = "subnets for workers"
  default = ["subnet-0843de099cd275280", "subnet-006aa011a526f0c48"]
}

variable "vpc" {
  description = "VPC ID"
  default = "vpc-0712f5b29ecc1e69f"
}

variable "instance_type" {
  description = "Instance Type"
  default = "t2.micro"
}
