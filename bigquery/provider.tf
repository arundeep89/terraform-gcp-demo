provider "google" {
  project     = var.project_id
  credentials = "${file(var.gcp_credentials)}"
  region      = var.gcp_region
  zone        = var.gcp_zone
}