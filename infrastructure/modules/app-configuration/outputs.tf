output "app_configuration_principal_id" {
  value       = azurerm_app_configuration.app_configuration.identity[0].principal_id
  description = "Principal ID of app configuration"
}

output "app_configuration_id" {
  value       = azurerm_app_configuration.app_configuration.id
  description = "ID of app configuration"
}
