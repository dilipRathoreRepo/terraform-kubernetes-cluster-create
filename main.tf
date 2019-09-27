provider "google" {
  credentials = "${file("/Users/diliprathore/terraform/terraform-working/creds/serviceaccount.json")}"
  project     = "vivid-fragment-222314"
  region      = "europe-west1"
}
