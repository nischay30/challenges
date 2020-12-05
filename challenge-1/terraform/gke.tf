# GKE cluster
resource "google_container_cluster" "challenge" {
  name     = var.project_id
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = var.gke_username
    password = var.gke_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

# #
resource "google_container_node_pool" "challenge_preemptible_nodes" {
  name       = var.project_id
  location   = var.region
  cluster    = google_container_cluster.challenge.name
  node_count = var.gke_num_nodes

  node_config {
    preemptible  = true
    machine_type = var.gke_node_type

    tags = ["gke-node", var.project_id]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}