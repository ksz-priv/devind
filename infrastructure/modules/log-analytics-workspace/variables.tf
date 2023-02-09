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

variable "sku" {
  type = string
}

variable "retention_in_days" {
  type = number
}
