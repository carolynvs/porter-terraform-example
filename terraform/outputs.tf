output "myvar" {
  value = var.myvar
}

output "username" {
  value = var.username
}
output "kubeconfig" {
  description = "kubeconfig"
  value       = module.k8s_cluster.kubeconfig_file
}

output "kubeconfig_content" {
  description = "kubeconfig"
  value       = module.k8s_cluster.kubeconfig_file_content
}

