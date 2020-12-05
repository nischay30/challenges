variable "project_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "region" {
  type    = string
  default = "europe-west2"
}

variable "zone" {
  type    = string
  default = "europe-west2-b"
}

variable "credentials_file" {
  description = "Credentials file for authentication to gcp"
  type        = string
  default     = "credentials.json"
}

variable "services" {
  description = "APIs which has to be enabled for this project"
  type        = list(string)
  default     = ["redis.googleapis.com","cloudresourcemanager.googleapis.com", "serviceusage.googleapis.com","iam.googleapis.com", "container.googleapis.com", "compute.googleapis.com"]
}

variable "gke_num_nodes" {
  description = "number of gke nodes"
  default     = 2
}

variable "gke_username" {
  description = "gke username"
  default     = ""
}

variable "gke_password" {
  description = "gke password"
  default     = ""
}

variable "gke_node_type" {
  description = "GKE node"
  default     = "n1-standard-1"
}