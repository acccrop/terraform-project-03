locals {
  tags = merge({
    Environment = var.environment
  }, var.tags)
}

module "network" {
  source  = "../vpc-network-blueprint-repo" # This should be referred from GitHub Repo
  environment = var.environment
  tags = var.tags
  vpc = var.vpc
}

module "eks_cluster" {
  source  = "../eks-cluster-blueprint-repo" # This should be referred from GitHub Repo
  environment = var.environment
  tags = var.tags
  vpc = {
    vpc_id = module.network.vpc_id
    private_subnets = module.network.private_subnets
  }
  eks = var.eks
}


