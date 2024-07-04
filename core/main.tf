resource "google_storage_bucket" "default" {
  name          = "${var.project_id}-bucket-tfstate"
  location      = "US"
  force_destroy = false
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}