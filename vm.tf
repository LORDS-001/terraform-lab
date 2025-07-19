resource "google_compute_instance" "test-vm1" {
  name         = "my-vm-1"
  machine_type = "e2-micro"          
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet1.id

    access_config {  
    }
  }
}



resource "google_compute_instance" "test-vm2" {
  name         = "my-vm-2"
  machine_type = "e2-micro"        
  zone         = "southamerica-west1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet2.id

    access_config {  
    }
  }
}



resource "google_compute_instance" "test-vm3" {
  name         = "my-vm-3"
  machine_type = "e2-micro"          
  zone         = "northamerica-south1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet3.id

    access_config {  
    }
  }
}