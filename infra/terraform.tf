terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.36.0"
    }
  }

  cloud {
    organization = "nullopsco"

    workspaces {
      name = "kubernetes-the-dumb-way"
    }
  }
}



