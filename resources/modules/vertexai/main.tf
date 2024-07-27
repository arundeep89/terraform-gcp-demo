resource "google_project_service" "demo_project_vertexai_service" {
  project = var.project_id
  service = "aiplatform.googleapis.com"
  disable_dependent_services = true
}
