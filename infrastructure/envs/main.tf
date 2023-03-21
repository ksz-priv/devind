terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.41.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.17.0"
    }
  }
}

#PROVIDER AZURERM

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
  source            = "../modules/kubernetes-cluster"
  resource_prefix   = local.resource_prefix
  rg_name           = module.resource_group.rg_name
  location          = var.location
  tags              = local.tags
  kubernetes_config = var.kubernetes_config
  log_aw_id         = module.log-aw.log_aw_id
}

module "log-aw" {
  source            = "../modules/log-analytics-workspace"
  resource_prefix   = local.resource_prefix
  rg_name           = module.resource_group.rg_name
  location          = var.location
  tags              = local.tags
  sku               = var.sku
  retention_in_days = var.retention_in_days
}

#PROVIDER KUBERNETES

provider "kubernetes" {
  host                   = module.kubernetes_cluster.kubernetes_host
  client_certificate     = base64decode(module.kubernetes_cluster.client_certificate)
  client_key             = base64decode(module.kubernetes_cluster.client_key)
  cluster_ca_certificate = base64decode(module.kubernetes_cluster.cluster_ca_certificate)
}

module "kubernetes_namespace_dev" {
  for_each       = { for namespace in var.namespace_names : namespace => namespace }
  source         = "../modules/kubernetes-namespace"
  namespace_name = each.key
}

# module "kubernetes_namespace_dev" {
#   source         = "../modules/kubernetes-namespace"
#   namespace_name = var.namespace_name_dev
# }

# module "kubernetes_namespace_stage" {
#   source         = "../modules/kubernetes-namespace"
#   namespace_name = var.namespace_name_stage
# }

# module "kubernetes_namespace_prod" {
#   source         = "../modules/kubernetes-namespace"
#   namespace_name = var.namespace_name_prod
# }


# module "app_configuration" {
#   source             = "../modules/app-configuration"
#   resource_prefix    = local.resource_prefix
#   location           = var.location
#   rg_name            = module.resource_group.rg_name
#   tags               = local.tags
#   app_configuration  = var.app_configuration
#   local_auth_enabled = var.app_configuration.local_auth_enabled
#   sku_name           = var.app_configuration.sku_name
# }


# module "role-assignment-ac" {
#   source = "../modules/role-assignment"
#   scope  = module.app_configuration.app_configuration_id
#   users  = var.user_roles_ac
# }

# module "variable_group_infra" {
#   source                     = "../modules/do-variable-group"
#   do_project_name            = var.do_project_name
#   do_variable_group          = var.do_variable_group_infra
#   do_variable_group_variable = local.do_variable_group_variable_infra
# }
