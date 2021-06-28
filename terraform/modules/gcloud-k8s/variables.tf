
variable "name" {
  default = "unknown-user"
}
variable "project" {
}
variable "location" {
  default = "us-central1-a"
}

variable "initial_node_count" {
  default = 1
}

variable "machine_type" {
  default = "n1-standard-2"
}

variable "preemptible_nodes" {
  type    = bool
  default = true
}


