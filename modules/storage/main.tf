# Define a Persistent Disk
resource "google_compute_disk" "additional_storage" {
  name  = "additional-disk"
  size  = 50                   # Disk size in GB
  type  = "pd-standard"        # Options: pd-standard, pd-ssd, pd-balanced

  labels = {
    environment = "test"       # Add custom labels
  }
}

# Attach Persistent Disk to an Existing Instance
resource "google_compute_attached_disk" "attach_additional_storage" {
  instance = "instance-name"                 # Replace with the name of your instance
  zone     = google_compute_disk.additional_storage.zone
  disk     = google_compute_disk.additional_storage.name
  device_name = "additional-disk"
}
