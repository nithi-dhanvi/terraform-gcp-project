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
module "compute" {
  source         = "./modules/stoprage"
  name  = "disk-01"
  size   = 10
  type = 
