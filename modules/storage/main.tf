resource "google_storage_bucket" "default" {
  name          = "terraform-demo-ap-bucket-raw-data"
  location      = "US"
  force_destroy = false
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}
