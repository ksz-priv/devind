#DEFAULT VALUES

owner       = "ksz"
environment = "dev"
project     = "devind"
location    = "West Europe"



#KUBERNETES

kubernetes_config = {
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

namespace_name_dev   = "dev"
namespace_name_stage = "stage"
namespace_name_prod  = "prod"

#LOG-AW

sku               = "PerGB2018"
retention_in_days = 30
