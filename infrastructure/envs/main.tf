terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.39.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
}

module "resource_group" {
  source          = "../modules/resource-group"
  resource_prefix = local.resource_prefix
  location        = var.location
  tags            = local.tags
}
