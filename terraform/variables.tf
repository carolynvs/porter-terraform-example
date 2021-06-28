variable "myvar" {
  description = "Value for 'myvar'"
  default = "myvar"
}

variable "username" {
  default = "porter-default"
}

variable "gcp_project_id" {}

variable "gcp_region" {
  default = "us-central1"
}


variable "gcp_location" {
  default = "us-central1-a"
}
