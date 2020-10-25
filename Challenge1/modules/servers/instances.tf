data "google_compute_image" "debian" {
  family  = "ubuntu-1804-lts"
  project = "gce-uefi-images"
}

data "template_file" "nginx" {
  template = file("${path.module}/template/install_nginx.tpl")

  vars = {
    ufw_allow_nginx = "Nginx HTTP"
  }
}

resource "google_compute_instance" "webservers" {
	name = "webserver"
	machine_type = var.machine_type
	# zone = lookup(var.azs, concat("zone", count.index))
	zone = "us-central1-a"
	tags = ["http-server"]
	labels = var.web_server_labels
	
	boot_disk {
		initialize_params {
        image = data.google_compute_image.debian.self_link
      }
	}
	
	network_interface {
		subnetwork = var.private_subnet
		access_config {
		// Ephemeral IP
		}
	}
	
	metadata_startup_script = data.template_file.nginx.rendered
}

resource "google_compute_instance" "appservers" {
	name = "appserver"
	machine_type = var.machine_type
	# zone = element(google_compute_instance.webservers.*.zone,count.index)
	zone = "us-central1-a"
	tags = ["app"]
	labels = var.app_server_labels
	
	boot_disk {
		initialize_params {
        image = data.google_compute_image.debian.self_link
      }
	}
	
	network_interface {
		subnetwork = var.private_subnet
		access_config {
		// Ephemeral IP
		}
	}

}