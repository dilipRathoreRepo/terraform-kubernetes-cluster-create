resource "google_container_cluster" "gke-cluster" {
  name               = var.cluster_name
  network            = var.network
  location           = var.location
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count = var.initial_node_count
}

resource "google_container_node_pool" "primary_nodes" {
  name       = var.node_pool_name
  location   = var.location
  cluster    = "${google_container_cluster.gke-cluster.name}"
  node_count = 0 

  node_config {
    preemptible  = var.preemptible
    machine_type = var.machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = var.oauth_scopes
  }
}
