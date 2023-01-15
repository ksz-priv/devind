locals {
  resource_group_suffix = "aks"
  tags                  = merge(var.tags)
  dns_prefix            = "dns"
}
