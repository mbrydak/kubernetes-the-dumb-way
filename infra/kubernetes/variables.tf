variable "project_id" {
  type        = string
  default     = "kubernetes-the-dumb-way-terraform"
  description = "project id"
}

variable "vpc_name" {
  type        = string
  default     = "kubernetes-the-dumb-way-vpc"
  description = "vpc name"
}

variable "vpc_cidr_range" {
  type        = string
  default     = "10.240.0.0/24"
  description = "vpc cidr range"
}

variable "region" {
  type        = string
  default     = "europe-west3"
  description = "region"
}

variable "machine_type" {
  type        = string
  default     = "e2-standard-2"
  description = "machine type"
}

variable "zone" {
  type        = string
  default     = "europe-west3-a"
  description = "zone"
}

variable "image" {
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
  description = "image"
}

variable "internal_cidr_range" {
  type        = list(string)
  default     = ["10.240.0.0/24", "10.200.0.0/16"]
  description = "internal cidr range"
}

variable "controller_service_account_scope" {
  type        = list(string)
  default     = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  description = "controller service account scope"
}

variable "worker_service_account_scope" {
  type        = list(string)
  default     = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  description = "controller service account scope"
}