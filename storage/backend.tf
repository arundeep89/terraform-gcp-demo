terraform {
    backend "gcs" {
        bucket = "terraform-demo-core-ap-bucket-tfstate"
        prefix = "storage/state"
        credentials = "credentials\\credentials.json"
    }
}