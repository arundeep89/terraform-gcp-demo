variable "gcp_service_list" {
  description ="The list of apis necessary for the project"
  type = list(string)
  default = [
    "iam.googleapis.com"
  ]
}

variable "project_id" {
    type = string
    description = "gcp project id"
}

variable "service_account_email" {
  type = string  
}

variable "region" {
  type = string
}