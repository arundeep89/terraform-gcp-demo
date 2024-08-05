terraform {
  source = "main.tf"
}

include {
  path = find_in_parent_folders()
}

locals {
  global_vars = yamldecode(file(find_in_parent_folders("global_vars.yaml")))
}

inputs = {
  project_id = local.global_vars.locals.project_id
  region = local.global_vars.locals.region
  service_account_email = local.global_vars.locals.service_account_email
}