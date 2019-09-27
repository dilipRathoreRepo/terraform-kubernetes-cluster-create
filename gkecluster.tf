resource "google_container_cluster" "gke-cluster" {
  name               = "mycluster"
  network            = "default"
  location           = "us-central1"
  remove_default_node_pool = true
  initial_node_count = 1 
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = "${google_container_cluster.gke-cluster.name}"
  node_count = 1 

  node_config {
    preemptible  = false
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/pubsub",
      "https://www.googleapis.com/auth/bigquery"
    ]
  }
}
