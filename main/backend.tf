terraform {
    backend "gcs" {
        bucket = "terraform-demo-core-ap-bucket-tfstate"
        prefix = "main-env/state"
        credentials = "credentials\\credentials.json"
    }
}