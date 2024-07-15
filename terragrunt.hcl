terraform {
  source = "modules/storage/"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  provider "google" {
     project     = "terraform-demo-ap"
     credentials = "credentials.json"
     region      = "us-east1"
     zone        = "us-east1-a"
  }
  EOF
}