resource "azurerm_log_analytics_workspace" "log_aw" {
  name                = "${var.resource_prefix}-${local.resource_group_suffix}"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
}
