resource "azurerm_kubernetes_cluster" "akscluster" {
  name                              = "${var.resource_prefix}-${local.resource_group_suffix}"
  location                          = var.location
  resource_group_name               = var.rg_name
  dns_prefix                        = "${var.resource_prefix}-${local.dns_prefix}"
  tags                              = local.tags
  role_based_access_control_enabled = var.kubernetes_config.role_based_access_control_enabled

  network_profile {
    network_plugin = var.kubernetes_config.network_profile.network_plugin
    network_policy = var.kubernetes_config.network_profile.network_policy
  }

  api_server_access_profile {
    authorized_ip_ranges = var.kubernetes_config.api_server_access_profile.authorized_ip_ranges
  }

  default_node_pool {
    name       = var.kubernetes_config.default_node_pool.name
    node_count = var.kubernetes_config.default_node_pool.node_count
    vm_size    = var.kubernetes_config.default_node_pool.vm_size
  }

  identity {
    type = var.kubernetes_config.identity.type
  }

  # zalozyc log aw
  # oms_agent {
  #   enabled = true
  #   log_analytics_workspace_id = 
  # }

}
