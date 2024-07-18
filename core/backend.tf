terraform {
    backend "gcs" {
        bucket = "terraform-demo-core-ap-bucket-tfstate"
        prefix = "core/state"
        credentials = "credentials.json"
    }
}