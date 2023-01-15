resource "azurerm_kubernetes_cluster" "akscluster" {
  name                = "${var.resource_prefix}-${local.resource_group_suffix}"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "${var.resource_prefix}-${local.dns_prefix}"
  tags                = local.tags

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B4ms"
  }

  identity {
    type = "SystemAssigned"
  }

}
