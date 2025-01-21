output "network_self_link" {
  value = google_compute_network.default.self_link
}

output "subnets" {
  value = google_compute_subnetwork.subnets[*].name
}
