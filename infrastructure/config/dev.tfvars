#DEFAULT VALUES

owner       = "ksz"
environment = "dev"
project     = "devind"
location    = "West Europe"



#KUBERNETES

kubernetes_config = {
  sku_tier                          = "Free"
  role_based_access_control_enabled = true
  network_profile = {
    network_plugin = "azure"
    network_policy = "calico"
  }

  api_server_access_profile = {
    authorized_ip_ranges = ["188.117.157.0/24"]
  }

  default_node_pool = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2ms"
  }

  identity = {
    type = "SystemAssigned"
  }
}

namespace_names = ["dev", "stage"]
# namespace_name_dev   = "dev"
# namespace_name_stage = "stage"
# namespace_name_prod  = "prod"

#LOG-AW

sku               = "PerGB2018"
retention_in_days = 30

#APP CONFIGURATION

# app_configuration = {
#   local_auth_enabled = true
#   #soft_delete_retention_days = 0
#   purge_protection_enabled = false
#   sku_name                 = "free"
#   public_network_access    = "Enabled"
# }

#ROLES APP CONF.

# user_roles_ac = [
#   {
#     role_definition_name = "Owner"
#     upn                  = "email@domena.com"
#   },
#   {
#     role_definition_name = "Owner"
#     upn                  = "email@domena.com"
#   }
# ]

#VARIABLE GROUP INFRA - DEVOPS

# do_variable_group_infra = {
#   name         = "terraform_infrastructure"
#   description  = "Names of resources required in pipelines for dev environment managed by terraform"
#   allow_access = false
# }
