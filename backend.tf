terraform {
    backend "gcs" {
        bucket = "terraform-gcp-demo-ap-state-core"
        prefix = "terraform/state"
        credentials = "credentials\\credentials.json"
    }
}