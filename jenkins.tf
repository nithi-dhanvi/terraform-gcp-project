resource "google_compute_address" "static_ip" {
  name   = "example-ip"
  region = "us-central1"
}

resource "google_compute_instance" "example" {
  name         = "jenkins01"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = "default"
    subnetwork = "default"
    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }
}
