locals {
  tags = merge({
    Environment = var.environment
  }, var.tags)
}

provider "kubernetes" {
  host                   = module.microservice_blueprint.cluster_endpoint
  cluster_ca_certificate = module.microservice_blueprint.cluster_ca_certificate_base64
  token                  = module.microservice_blueprint.cluster_token
  load_config_file       = false
  version                = "~> 1.11"
}

module "microservice_blueprint" {
  source  = "../../microservice-blueprint-repo" # This should be referred from GitHub Repo
  environment = var.environment
  tags = var.tags
  vpc = var.vpc
  eks = var.eks
}
