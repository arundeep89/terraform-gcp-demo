terraform {
    backend "gcs" {
        bucket = "terraform-demo-core-ap-bucket-tfstate"
        prefix = "resources/state"
        credentials = "credentials\\credentials.json"
    }
}