# Specify the GCP Provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# provider "google" {
#   credentials = "${file("service-account.json")}"
#   project     = var.project_id
#   region      = var.region
#   zone        = var.zone (req?)
# }