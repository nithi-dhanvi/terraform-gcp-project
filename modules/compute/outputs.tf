output "instance_name" {
  value = google_compute_instance.default.name
}

output "instance_self_link" {
  value = google_compute_instance.default.self_link
}
