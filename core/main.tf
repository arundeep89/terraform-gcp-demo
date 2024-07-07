resource "google_storage_bucket" "default" {
  name          = "${var.project_id}-bucket-tfstate"
  location      = "US"
  force_destroy = false
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

resource "google_project_service" "demo_core_project_crm_service" {
  project = var.project_id
  service = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = true
}