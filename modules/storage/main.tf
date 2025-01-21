# Define a Persistent Disk
resource "google_compute_disk" "additional_storage" {
  name = var.name
 # name  = "additional-disk"
 # size  = 50    
  size = var.size    # Disk size in GB
  type = var.type
  zone = var.zone
  #type  = "pd-standard"        # Options: pd-standard, pd-ssd, pd-balanced

  labels = {
    #environment = "test"       # Add custom labels
    environment = var.env
  }
}

# Attach Persistent Disk to an Existing Instance
resource "google_compute_attached_disk" "attach_additional_storage" {
instance = var.instance                 # Replace with the name of your instance
zone     = google_compute_disk.additional_storage.zone
  disk     = google_compute_disk.additional_storage.name
 device_name = var.name
}
