terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.41.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source          = "../modules/resource-group"
  resource_prefix = local.resource_prefix
  location        = var.location
  tags            = local.tags
}

module "kubernetes_cluster" {
  source             = "../modules/kubernetes-cluster"
  resource_prefix    = local.resource_prefix
  rg_name            = module.resource_group.rg_name
  location           = var.location
  tags               = local.tags
  kubernetes_network = var.kubernetes_network
}
