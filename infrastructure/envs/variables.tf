variable "owner" {
  type        = string
  description = "Owner of the project"
}

variable "environment" {
  type        = string
  description = "Name of the environment"
}

variable "project" {
  type        = string
  description = "Name of the project"
}

variable "location" {
  type        = string
  description = "Location of the resources"
}


variable "kubernetes_network" {
  type = object({
    network_profile = object({
      network_plugin = string
      network_policy = string
    })

    api_server_access_profile = object({
      authorized_ip_ranges = list(string)
    })
  })

}
