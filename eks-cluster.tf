provider "aws" {
  region = var.region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.20.0"
  cluster_name    = "eks-cluster" #local.cluster_name
  cluster_version = "1.20"
  
  subnets         = var.subnets

  tags = {
    Environment = "development"
    GithubRepo  = "terraform-aws-eks"
    GithubOrg   = "tzerraform-aws-modules"
  }
  vpc_id = var.vpc

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "linux-node-1"
      instance_type                 = var.instance_type
      additional_userdata           = "worker-1"
      associate_public_ip_address   = true
      key_name                      = "anil"
      asg_desired_capacity          = 1
      subnets                       = [var.subnets[0]]
      platform                      = "linux"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },

# Uncomment below part if you need more worker of different plateform, below example for windows workder node.
 #   {
 #     name                          = "windows-node-1"
 #     instance_type                 = var.instance_type
 #     additional_userdata           = "worker-2"
 #     platform                      = "windows"
 #     associate_public_ip_address   = true
 #     key_name                      = "anil"
 #     subnets                       = [var.subnets[0]]
 #     additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
 #     asg_desired_capacity          = 1
 #     #tags = {
 #     #Name = "windows-node-1"
 #   #}
 #   },
  ]
}

resource "aws_key_pair" "anil" {
  key_name   = "anil"
  public_key = "${var.ssh_key}"
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
