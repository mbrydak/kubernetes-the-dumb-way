resource "google_compute_network" "kubernetes_the_hard_way" {
  name                    = "kubernetes-the-hard-way"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "kubernetes" {
  name          = "kubernetes"
  ip_cidr_range = "10.240.0.0/24"
  region        = var.region
  network       = google_compute_network.kubernetes_the_hard_way.id
}

resource "google_compute_firewall" "kubernetes_the_hard_way_allow_internal" {
  name    = "kubernetes-the-hard-way-allow-internal"
  network = google_compute_network.kubernetes_the_hard_way.id

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
  }
  source_ranges = var.internal_cidr_range
}

resource "google_compute_firewall" "kubernetes_the_hard_way_allow_external" {
  name    = "kubernetes-the-hard-way-allow-external"
  network = google_compute_network.kubernetes_the_hard_way.id

  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22", "6443"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_address" "kubernetes_the_hard_way_external_lb_ip" {
  name = "kubernetes-the-hard-way-external-lb-ip"
}