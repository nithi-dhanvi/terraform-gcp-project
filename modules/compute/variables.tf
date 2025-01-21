variable "instance_name" {
  description = "The name of the compute instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type of the instance"
  type        = string
}

variable "zone" {
  description = "The zone where the instance will be created"
  type        = string
}

variable "network" {
  description = "The self_link of the network"
  type        = string
}

variable "subnetwork" {
  description = "The name of the subnetwork"
  type        = string
}
