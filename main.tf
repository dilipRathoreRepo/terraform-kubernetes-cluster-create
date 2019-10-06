provider "google" {
  credentials = "${file("/Users/diliprathore/terraform/terraform-working/creds/serviceaccount.json")}"
  project     = var.project
  region      = var.region
}
