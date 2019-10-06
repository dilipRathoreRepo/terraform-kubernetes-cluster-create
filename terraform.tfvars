project = "rising-minutia-254502"
region = "europe-west1"
credentials = "${file("/Users/diliprathore/terraform/terraform-working/creds/serviceaccount.json")}"
cluster_name = "mycluster"
network = "default"
location = "europe-west1"
remove_default_node_pool = true
initial_node_count = 1
node_pool_name = "my-node-pool"
preemptible  = false
machine_type = "n1-standard-1"
oauth_scopes = [
  "https://www.googleapis.com/auth/logging.write",
  "https://www.googleapis.com/auth/monitoring",
  "https://www.googleapis.com/auth/pubsub",
  "https://www.googleapis.com/auth/bigquery"
]
