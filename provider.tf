provider "google" {
  project     = "terraform-gcp-demo-ap"
  credentials = file("\\credentials\\credentials.json")
  region      = "us-central1"
  zone        = "us-central1-c"
}