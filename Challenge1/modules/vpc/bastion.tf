data "google_compute_image" "bastion" {
  family  = "ubuntu-1804-lts"
  project = "gce-uefi-images"
}

resource "google_compute_address" "bastionip" {
	name = "bastionip"
}

resource "google_compute_instance" "bastion" {
	name = "bastion"
	machine_type = var.machine_type
	# zone = lookup(var.azs, concat("zone", count.index))
	zone = "us-central1-a"
	tags = ["bastion"]
	
	boot_disk {
		initialize_params {
        image = data.google_compute_image.bastion.self_link
      }
	}
	
	network_interface {
		subnetwork = google_compute_subnetwork.public-subnet.self_link
		access_config { 
		nat_ip = google_compute_address.bastionip.address
		}
	}
			
	# metadata {	
	# 	host_group = "bastion"
	# 	sshKeys = var.keypair
	# }
}