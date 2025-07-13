terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = "daniel-project-462315"
  credentials = file("daniel-project-462315-4ab57b348593.json")
}

resource "google_compute_instance" "test-vm" {
  name         = "my-vm"
  machine_type = "e2-micro"          
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = "default"

    access_config {  
    }
  }
}