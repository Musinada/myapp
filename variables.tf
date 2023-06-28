variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "ssh_key" {
  description = "ssh-key to login to the instances"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZFuuu7wQCfVl3kHpnLPFfYTaSQ74IhEYV+Q2LXee6s0jtJsAo6BlZ7GUkPm6qa7Z+O2jXphe8VQsB5btMxv1Us5xS+AyIlPWFC1pRAsoJULmg8Tc7s97+l6BPzVwfDhFqIZkZpRnY7KYb438+/wA9ahdfeYb1BiptN/VUfGz12gmJhppDh5/MyyXUhwUrmLDSnsxr+VyLTfeffMhz2KXGF3UR3mjgPklIMpwMQJPoM6rEUJ4zpz+cVJLBRAQT0QXZMvjd+eNxg6bgWlnHYvK/1KdQDY6q/KaKMKJqHVNYRMpRgcBnfyHhiPP5ePzcB1aQgHJl9uwyTkwjcukvJZw7 cicd"
}

variable "subnets" {
  description = "subnets for workers"
  default = ["subnet-0c1622b82b3c369e3", "subnet-0a76e2183953fdd87"]
}

variable "vpc" {
  description = "VPC ID"
  default = "vpc-06d9c1d3ecf203e11"
}

variable "instance_type" {
  description = "Instance Type"
  default = "r5.2xlarge"
}
