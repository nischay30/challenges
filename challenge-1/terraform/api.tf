resource "google_project_service" "apis" {
  count   = length(var.services)
  project = var.project_id
  service = var.services[count.index]
}