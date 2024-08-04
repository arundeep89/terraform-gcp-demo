variable "project_id" {
    type = string
    description = "gcp project id"
}

variable "region" {
  type = string
  default = "us-east1"
}

variable "service_account_email" {
  type = string
  default = "sa-terraform-core@terraform-demo-core-ap.iam.gserviceaccount.com"
  
}