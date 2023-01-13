resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_prefix}-${local.resource_group_suffix}"
  location = var.location
  tags     = local.tags
}
