provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
  project     = "vivid-fragment-222314"
  region      = "europe-west1"
}
