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

variable "kubernetes_config" {
  type = object({
    role_based_access_control_enabled = bool
    sku_tier                          = string
    network_profile = object({
      network_plugin = string
      network_policy = string
    })

    api_server_access_profile = object({
      authorized_ip_ranges = list(string)
    })

    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })

    identity = object({
      type = string
    })
  })

}

variable "log_aw_id" {
  type = string
}
