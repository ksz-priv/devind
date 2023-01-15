resource "azurerm_kubernetes_cluster" "akscluster" {
  name                = "${var.resource_prefix}-${local.resource_group_suffix}"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "${var.resource_prefix}-${local.dns_prefix}"
  tags                = local.tags

  #tfsec

  api_server_authorized_ip_ranges = [
    "1.2.3.4/32"
  ]

  role_based_access_control {
    enabled = true
  }

  network_profile {
    network_policy = "calico"
  }

  addon_profile {
    oms_agent {
      enabled = true
    }
  }

  #end tfsec

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B4ms"
  }

  identity {
    type = "SystemAssigned"
  }

}
