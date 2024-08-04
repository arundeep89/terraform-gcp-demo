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
}