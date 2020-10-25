data "google_compute_image" "nat" {
  family  = "ubuntu-1804-lts"
  project = "gce-uefi-images"
}

resource "google_compute_address" "natip" {
	name = "natip"
}

resource "google_compute_instance" "nat" {
	name = "natgateway"
	machine_type = var.machine_type
	#zone = lookup(var.azs, concat("zone", count.index))
	zone = "us-central1-a"
	tags = ["nat"]
	can_ip_forward = "true"
	
	boot_disk {
		initialize_params {
        image = data.google_compute_image.nat.self_link
      }
	}	
	
	network_interface {
		subnetwork = google_compute_subnetwork.public-subnet.self_link
		access_config { 
		nat_ip = google_compute_address.natip.address	
		}
	}

	# metadata {	
	# 	host_group = "nat"
	# 	sshKeys = var.keypair
	# }
}