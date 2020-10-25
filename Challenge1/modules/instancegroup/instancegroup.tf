resource "google_compute_instance_group" "api" {
  project   = var.project_id
  name      = "${var.name}-instance-group"
  # zone      = lookup(var.azs, concat("zone", count.index))
  zone = "us-central1-a"
  instances = [google_compute_instance.api.self_link]

  lifecycle {
    create_before_destroy = true
  }

  named_port {
    name = "http"
    port = 80
  }
}

resource "google_compute_instance" "api" {
  project      = var.project_id
  name         = "${var.name}-instance"
  machine_type = "f1-micro"
  # zone         = lookup(var.azs, concat(["zone"], count.index))
  zone = "us-central1-a"
  
  tags = ["private-app"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = var.private_subnet
    access_config {
    }
  }
}
