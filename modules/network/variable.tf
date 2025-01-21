variable "network_name" {
  description = "The name of the network"
  type        = string
}

variable "subnets" {
  description = "List of subnet configurations"
  type = list(object({
    name           = string
    ip_cidr_range  = string
    region         = string
  }))
}
