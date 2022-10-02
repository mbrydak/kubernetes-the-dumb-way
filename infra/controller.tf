resource "google_compute_instance" "controller_node" {
  count        = 3
  name         = "controller-${count.index}"
  machine_type = var.machine_type
  zone         = var.zone
  network_interface {
    subnetwork = google_compute_subnetwork.kubernetes.name
    network_ip = "10.240.0.${count.index + 10}"
    access_config {}
  }
  can_ip_forward = true
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  # metadata_startup_script = base64encode(templatefile("${path.module}/startup.sh", {
  #   hostname = "controller-${count.index}"
  #   ip       = "10.240.0.${count.index + 10}"
  # }))
  service_account {
    scopes = var.controller_service_account_scope
  }

  tags = ["kubernetes-the-hard-way", "controller"]
}