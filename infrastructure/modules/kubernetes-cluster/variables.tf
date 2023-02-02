variable "resource_prefix" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
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
