## public subnet

resource "google_compute_subnetwork" "public-subnet" {
     name          = "${var.name}-public-subnet"
     ip_cidr_range = var.public-subnet-cidr
     network       = google_compute_network.network.id
     depends_on    = [google_compute_network.network]
     region        = var.region
    }


## private subnet

resource "google_compute_subnetwork" "private-subnet" {
     name          = "${var.name}-private-subnet"
     ip_cidr_range = var.private-subnet-cidr
     network       = google_compute_network.network.id
     depends_on    = [google_compute_network.network]
     region        = var.region
     private_ip_google_access = true
    }