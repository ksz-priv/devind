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

variable "local_auth_enabled" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "app_configuration" {
  type = object({
    local_auth_enabled = bool
    #soft_delete_retention_days = number
    purge_protection_enabled = bool
    sku_name                 = string
    public_network_access    = string
  })
}
