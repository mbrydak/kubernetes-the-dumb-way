provider "google" {
  region  = "europe-west3"
  zone    = "europe-west3-a"
  project = var.project_id
}

provider "google-beta" {
  region  = "europe-west3"
  zone    = "europe-west3-a"
  project = var.project_id
}