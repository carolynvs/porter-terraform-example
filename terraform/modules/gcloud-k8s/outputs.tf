output "endpoint" {
  value = google_container_cluster.default.endpoint
}

output "cluster_main_version" {
  value = google_container_cluster.default.master_version
}

output "cluster_id" {
  value = google_container_cluster.default.id
}

output "cluster_endpoint" {
  value = google_container_cluster.default.endpoint
}

output "cluster_ca_cert" {
  value = google_container_cluster.default.master_auth[0].cluster_ca_certificate
}

output "cluster_name" {
  value = google_container_cluster.default.name
}

output "kubeconfig_file" {
  value = local_file.kubeconfig.filename
}

output "kubeconfig_file_content" {
  value = local_file.kubeconfig.content
}