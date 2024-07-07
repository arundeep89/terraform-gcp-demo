terraform {
    backend "gcs" {
        bucket = "terraform-demo-core-ap-bucket-tfstate"
        prefix = "bigquery/state"
        credentials = "credentials\\credentials.json"
    }
}