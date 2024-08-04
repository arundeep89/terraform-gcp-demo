variable "project_id" {
    type = string
    description = "gcp project id"
}

variable "region" {
  type = string
}

variable "service_account_email" {
  type = string  
}

variable "gcp_service_list" {
  description ="The list of apis necessary for the project"
  type = list(string)
  default = [
    "cloudfunctions.googleapis.com",
    "cloudbuild.googleapis.com",
    "logging.googleapis.com",
    "pubsub.googleapis.com"
  ]
}