terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.38.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.38.0"
    }
  }

  cloud {
    organization = "nullopsco"

    workspaces {
      name = "kubernetes-the-dumb-way"
    }
  }
}

resource "random_id" "id" {
  byte_length = 3

}
