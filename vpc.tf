resource "google_compute_network" "vpc-network" {
  name                    = "my-vpc"
  auto_create_subnetworks = false
}



resource "google_compute_subnetwork" "subnet1" {
  name          = "my-subnet-1"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc-network.id
}



resource "google_compute_subnetwork" "subnet2" {
  name          = "my-subnet-2"
  ip_cidr_range = "10.0.1.0/24"
  region        = "southamerica-west1"
  network       = google_compute_network.vpc-network.id
}



resource "google_compute_subnetwork" "subnet3" {
  name          = "my-subnet-3"
  ip_cidr_range = "10.0.2.0/24"
  region        = "northamerica-south1"
  network       = google_compute_network.vpc-network.id
}



resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.vpc-network.id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "allow-https" {
  name    = "allow-https"
  network = google_compute_network.vpc-network.id

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https-server"]
}