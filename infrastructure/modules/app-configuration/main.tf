resource "azurerm_app_configuration" "app_configuration" {
  name                     = "${var.resource_prefix}-${local.app_configuration_suffix}"
  resource_group_name      = var.rg_name
  location                 = var.location
  sku                      = var.app_configuration.sku_name
  local_auth_enabled       = var.app_configuration.local_auth_enabled
  public_network_access    = var.app_configuration.public_network_access
  purge_protection_enabled = var.app_configuration.purge_protection_enabled
  #soft_delete_retention_days = var.app_configuration.soft_delete_retention_days
  tags = local.tags

  identity {
    type = "SystemAssigned"
  }
}
