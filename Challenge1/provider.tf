provider "google" {
    credentials = file(var.sa_file_path)
    project = var.project_id
    region = var.region
}