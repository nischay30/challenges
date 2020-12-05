resource "google_project" "my_project" {
  name       = var.project_name
  project_id = var.project_id
}

resource "google_app_engine_application" "app" {
  project     = google_project.my_project.project_id
  location_id = var.region
}