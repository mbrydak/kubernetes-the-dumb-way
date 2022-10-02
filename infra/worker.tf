resource "google_compute_instance" "worker_node" {
  count        = 3
  name         = "worker-${count.index}"
  machine_type = var.machine_type
  zone         = var.zone
  network_interface {
    subnetwork = google_compute_subnetwork.kubernetes.name
    network_ip = "10.240.0.${count.index + 20}"
    access_config {}
  }
  can_ip_forward = true
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  service_account {
    scopes = var.worker_service_account_scope
  }

  metadata = {
    pod-cidr = "10.200.${count.index}.0/24"
  }

  tags = ["kubernetes-the-hard-way", "worker"]
}