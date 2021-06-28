
locals {
  cluster_name = "${var.name}-cluster"
  common_labels = {
    "owner" = var.name,
  }
}

###################################################
# Cluster
###################################################
resource "google_container_cluster" "default" {
  name        = local.cluster_name
  project     = var.project
  description = "Demo GKE Cluster"
  location    = var.location

  //remove_default_node_pool = true
  initial_node_count       = var.initial_node_count

  provider = google-beta

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = true
    }
  }
}

data "google_client_config" "default" {
}

data "template_file" "kubeconfig" {
  template = file("${path.module}/templates/kubeconfig-template.yaml")

  vars = {
    cluster_name  = google_container_cluster.default.name
    endpoint      = google_container_cluster.default.endpoint
    cluster_ca    = google_container_cluster.default.master_auth[0].cluster_ca_certificate
    cluster_token = data.google_client_config.default.access_token
  }
}

resource "local_file" "kubeconfig" {
  content         = data.template_file.kubeconfig.rendered
  filename        = "${path.root}/${var.name}-kubeconfig"
  file_permission = "0600"
}

