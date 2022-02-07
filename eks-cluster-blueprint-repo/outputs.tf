output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_ca_certificate_base64" {
  description = "Cluster CA Certificate Base64"
  value       = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

output "cluster_token" {
  description = "Cluster Token"
  value       = data.aws_eks_cluster_auth.cluster.token
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks.cluster_security_group_id
}

output "kubectl_config" {
  description = "kubectl config as generated by the module."
  value       = module.eks.kubeconfig
}

output "config_map_aws_auth" {
  description = "A kubernetes configuration to authenticate to this EKS cluster."
  value       = module.eks.config_map_aws_auth
}

output "cluster_id" {
  description = "EKS Cluster Id"
  value       = module.eks.cluster_id
}