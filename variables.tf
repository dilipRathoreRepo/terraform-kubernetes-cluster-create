variable "project" {
	type = string
	default = "rising-minutia-254502"
}
variable "region" {
	type = string
	default = "europe-west1"
}
variable "cluster_name" {
	type = string
	default = "mycluster"
}
variable "network" {
	type = string
	default = "default"
}
variable "location" {
	type = string
	default = "europe-west1"
}
variable "remove_default_node_pool" {
	type = bool
	default = true
}
variable "initial_node_count" {
	type = number
	default = 1
}
variable "node_pool_name" {
	type = string
	default = "my-node-pool"
}
variable "preemptible" {
	type = bool
	default = false
}
variable "machine_type" {
	type = string
	default = "n1-standard-1"
}
variable "oauth_scopes" {
	type = list(string)
	default = [
	  "https://www.googleapis.com/auth/logging.write",
	  "https://www.googleapis.com/auth/monitoring",
	  "https://www.googleapis.com/auth/pubsub",
	  "https://www.googleapis.com/auth/bigquery"
]
}
