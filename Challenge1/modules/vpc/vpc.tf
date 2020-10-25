resource "google_compute_network" "network" {
  name                            = "${var.name}-vpc"
  auto_create_subnetworks         = var.auto_create_subnetworks
  project                         = var.project_id
}