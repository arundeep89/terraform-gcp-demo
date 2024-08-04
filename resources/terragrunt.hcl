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

remote_state {
  backend  = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "terraform-demo-core-ap-bucket-tfstate"
    prefix = "${path_relative_to_include()}"
    credentials = "credentials.json"
  }
}