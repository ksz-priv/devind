resource "azurerm_kubernetes_cluster" "akscluster" {
  name                              = "${var.resource_prefix}-${local.resource_group_suffix}"
  location                          = var.location
  resource_group_name               = var.rg_name
  dns_prefix                        = "${var.resource_prefix}-${local.dns_prefix}"
  tags                              = local.tags
  role_based_access_control_enabled = true

  network_profile {
    network_plugin = var.kubernetes_network.network_profile.network_plugin
    network_policy = var.kubernetes_network.network_profile.network_policy
  }

  api_server_access_profile {
    authorized_ip_ranges = var.kubernetes_network.api_server_access_profile.authorized_ip_ranges
  }

  # zalozyc log aw
  # oms_agent {
  #   enabled = true
  #   log_analytics_workspace_id = 
  # }

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B4ms"
  }

  identity {
    type = "SystemAssigned"
  }

}
