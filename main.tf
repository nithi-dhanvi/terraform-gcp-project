module "network" {
  source       = "./modules/network"
  network_name = "example-network"
  subnets = [
    {
      name           = "subnet-1"
      ip_cidr_range  = "10.0.1.0/24"
      region         = var.region
    },
    {
      name           = "subnet-2"
      ip_cidr_range  = "10.0.2.0/24"
      region         = var.region
    }
  ]
}

module "compute" {
  source         = "./modules/compute"
  instance_name  = "example-instance"
  machine_type   = "e2-micro"
  zone           = "us-central1-a"
  network        = module.network.network_self_link
  subnetwork     = module.network.subnets[0]
}
module "storage" {
  source         = "./modules/storage"
  name  = "disk-01"
  size   = 10
  type = "pd-standard"
  zone           = "us-central1-a"
}

# Attach Persistent Disk to an Existing Instance
resource "google_compute_attached_disk" "attach_additional_storage" {
 instance = "example-instance"                 # Replace with the name of your instance
 zone     = google_compute_disk.additional_storage.zone
 disk     = google_compute_disk.additional_storage.name
 device_name = "disk-01"
}
